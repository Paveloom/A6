submodule ( jacobi_m ) apply_jacobi_loud_s ! Подмодуль, содержащий процедуру, реализующую
                                           ! метод Якоби для поиска собственных значений и
                                           ! векторов симметричных матриц
implicit none
     
     contains
     
     ! Процедура, реализующая метод Якоби для поиска
     ! собственных значений и векторов симметричных матриц
     module procedure apply_jacobi_loud

          ! Внедиагональный максимум и его индексы
          type ( max_type ) :: max

          ! Указатель на число строк матрицы
          integer(IP), pointer :: N

          ! Число строк матрицы (на точности JP)
          integer(JP) :: N_JP

          ! Указатель на матрицу объекта
          real(RP), dimension(:, :), pointer :: A

          ! Новая матрица объекта
          real(RP), dimension(:, :), allocatable :: NA

          ! Матрица вращения (глобальная)
          real(RP), dimension(:, :), allocatable :: U

          ! Матрица вращения (итерационная)
          real(RP), dimension(:, :), allocatable :: U_k

          ! Угол поворота матрицы вращения
          real(RP) :: phi

          ! Вспомогательные переменные
          integer(JP) :: k ! Счетчик итераций
          real(RP) :: pi   ! Число pi

          ! Вспомогательные строки автоформатирования
          character(FP) :: f1, f2, f3

          ! Вычисление числа pi
          pi = 4._RP * atan(1._RP)

          ! Распаковка объекта
          N => input%get_N()
          A => input%get_matrix()

          ! Конвертация
          N_JP = int(N, kind = JP)

          ! Запись числа JP в строку
          write(f1,'(i2)') JP

          ! Запись числа N_JP в строку
          write(f3,'(i'//f1//')') N_JP

          write(*,'(/, 5x, a, /)') 'Исходная матрица:'
          write(*,'('//f3//'(4x, '//RF//'))') A

          ! Проверка, является ли матрица симметричной
          call test_if_the_matrix_is_symmetric(N_JP, A)

          ! Выделение памяти под матрицы вращения
          call allocate(N_JP, U, U_k, NA)

          ! [ Первая итерация с некоторыми изменениями ]

          k = 1_JP
          write(*,'(/, 5x, a, /)') 'k = 1'

          ! Получение внедигонального максимума
          call get_max(N_JP, A, max)

          write(*,'(5x, a, /)') 'Внедиагональный максимум:'
          write(*,'(5x, a, '//RF//')') 'Значение:', max%value
          write(*,'(5x, a, 1x, i'//f1//')') 'Номер столбца:', max%i
          write(*,'(5x, a, 2x, i'//f1//', /)') 'Номер строки:', max%j

          ! Вычисление угла поворота матрицы вращения
          phi = get_phi(A, max, pi)

          write(*,'(5x, a, /)') 'Угол поворота матрицы вращения:'
          write(*,'(5x, a, '//RF//', /)') 'Значение:', phi

          ! Получение итерационной матрицы вращения
          call get_rotation_matrix(phi, N_JP, max, U_k)

          ! Обновление глобальной матрицы вращения
          U = U_k

          write(*,'(5x, a, /)') 'Итерационная матрица вращения:'
          write(*,'('//f3//'(4x, '//RF//'))') U_k
          write(*,'()')

          ! Применение глобальной матрицы вращения
          NA = matmul(U, matmul(A, transpose(U)))

          write(*,'(5x, a, /)') 'Результат применения глобальной матрицы вращения:'
          write(*,'('//f3//'(4x, '//RF//'))') NA
          write(*,'()')

          ! [ Последующий цикл ]

          do while ( the_matrix_is_not_diagonal(N_JP, NA) )

               ! Увеличение счетчика итераций
               k = k + 1_JP

               ! Запись числа k в строку
               write(f2, '(i'//f1//')') k

               ! Вывод номера итерации
               write(*,'(5x, a, /)') 'k = '//trim(adjustl(f2))

               ! Получение внедигонального максимума
               call get_max(N_JP, NA, max)

               write(*,'(5x, a, /)') 'Внедиагональный максимум:'
               write(*,'(5x, a, '//RF//')') 'Значение:', max%value
               write(*,'(5x, a, 1x, i'//f1//')') 'Номер столбца:', max%i
               write(*,'(5x, a, 2x, i'//f1//', /)') 'Номер строки:', max%j

               ! Вычисление угла поворота матрицы вращения
               phi = get_phi(NA, max, pi)

               write(*,'(5x, a, /)') 'Угол поворота матрицы вращения:'
               write(*,'(5x, a, '//RF//', /)') 'Значение:', phi
     
               ! Получение итерационной матрицы вращения
               call get_rotation_matrix(phi, N_JP, max, U_k)

               write(*,'(5x, a, /)') 'Итерационная матрица вращения:'
               write(*,'('//f3//'(4x, '//RF//'))') U_k
               write(*,'()')
     
               ! Обновление глобальной матрицы вращения
               U = matmul(U_k, U)

               write(*,'(5x, a, /)') 'Глобальная матрица вращения:'
               write(*,'('//f3//'(4x, '//RF//'))') U
               write(*,'()')

               ! Применение глобальной матрицы вращения
               NA = matmul(U, matmul(A, transpose(U)))

               write(*,'(5x, a, /)') 'Результат применения глобальной матрицы вращения:'
               write(*,'('//f3//'(4x, '//RF//'))') NA
               write(*,'()')

          enddo

          write(*,'(5x, a, /)') 'Итоговая матрица:'
          write(*,'('//f3//'(4x, '//RF//'))') NA
          write(*,'()')

          ! Отправка результата
          call send_result(N_JP, U, NA, result)

          ! Освобождение памяти из-под матриц вращения
          call deallocate(U, U_k, NA)

     end procedure apply_jacobi_loud
     
end submodule apply_jacobi_loud_s