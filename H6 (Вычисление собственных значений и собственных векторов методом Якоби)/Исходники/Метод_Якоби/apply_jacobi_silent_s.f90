submodule ( jacobi_m ) apply_jacobi_silent_s ! Подмодуль, содержащий процедуру, реализующую
                                           ! метод Якоби для поиска собственных значений и
                                           ! векторов симметричных матриц
implicit none
     
     contains
     
     ! Процедура, реализующая метод Якоби для поиска
     ! собственных значений и векторов симметричных матриц
     module procedure apply_jacobi_silent

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
          real(RP) :: pi   ! Число pi

          ! Вычисление числа pi
          pi = 4._RP * atan(1._RP)

          ! Распаковка объекта
          N => input%get_N()
          A => input%get_matrix()

          ! Конвертация
          N_JP = int(N, kind = JP)

          ! Проверка, является ли матрица симметричной
          call test_if_the_matrix_is_symmetric(N_JP, A)

          ! Выделение памяти под матрицы вращения
          call allocate(N_JP, U, U_k, NA)

          ! [ Первая итерация с некоторыми изменениями ]

          ! Получение внедигонального максимума
          call get_max(N_JP, A, max)

          ! Вычисление угла поворота матрицы вращения
          phi = get_phi(A, max, pi)

          ! Получение итерационной матрицы вращения
          call get_rotation_matrix(phi, N_JP, max, U_k)

          ! Обновление глобальной матрицы вращения
          U = U_k

          ! Применение глобальной матрицы вращения
          NA = matmul(U, matmul(A, transpose(U)))

          ! [ Последующий цикл ]

          do while ( the_matrix_is_not_diagonal(N_JP, NA) )

               ! Получение внедигонального максимума
               call get_max(N_JP, NA, max)

               ! Вычисление угла поворота матрицы вращения
               phi = get_phi(NA, max, pi)

               ! Получение итерационной матрицы вращения
               call get_rotation_matrix(phi, N_JP, max, U_k)

               ! Обновление глобальной матрицы вращения
               U = matmul(U_k, U)

               ! Применение глобальной матрицы вращения
               NA = matmul(U, matmul(A, transpose(U)))

          enddo

          ! Отправка результата
          call send_result(N_JP, U, NA, result)

          ! Освобождение памяти из-под матриц вращения
          call deallocate(U, U_k, NA)

     end procedure apply_jacobi_silent
     
end submodule apply_jacobi_silent_s