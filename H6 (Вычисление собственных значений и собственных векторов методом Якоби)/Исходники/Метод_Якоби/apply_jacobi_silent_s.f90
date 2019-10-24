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
          integer(IP), pointer :: N_pt

          ! Объект, объединяющий число строк матрицы с использующими его разностями
          type ( N_type ) :: N

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
          N_pt => input%get_N()
          A => input%get_matrix()

          ! Конвертация
          N%m0 = int(N_pt, kind = JP)

          ! Вычисление разностей,
          ! использующих число строк матрицы
          
          N%m1 = N%m0 - 1_JP
          N%m2 = N%m0 - 2_JP

          ! Проверка, является ли матрица симметричной
          call test_if_the_matrix_is_symmetric(N, A)

          ! Выделение памяти под матрицы вращения
          ! и под новую матрицу объекта
          call allocate(N, U, U_k, NA)

          ! [ Первая итерация с некоторыми изменениями ]

          ! Получение внедигонального максимума
          call get_max(N, max, matrix_pointer = A)

          ! Вычисление угла поворота матрицы вращения
          call get_phi(max, pi, phi, matrix_pointer = A)

          ! Получение итерационной матрицы вращения
          call get_rotation_matrix(phi, N, max, U_k)

          ! Обновление глобальной матрицы вращения
          U(1_JP:N%m0, 1_JP:N%m0) = U_k

          ! Применение глобальной матрицы вращения
          NA(1_JP:N%m0, 1_JP:N%m0) = matmul(U, matmul(A, transpose(U)))

          ! [ Последующий цикл ]

          do while ( the_matrix_is_not_diagonal(N, NA) )

               ! Получение внедигонального максимума
               call get_max(N, max, matrix = NA)

               ! Вычисление угла поворота матрицы вращения
               call get_phi(max, pi, phi, matrix = NA)

               ! Получение итерационной матрицы вращения
               call get_rotation_matrix(phi, N, max, U_k)

               ! Обновление глобальной матрицы вращения
               U(1_JP:N%m0, 1_JP:N%m0) = matmul(U_k, U)

               ! Применение глобальной матрицы вращения
               NA(1_JP:N%m0, 1_JP:N%m0) = matmul(U, matmul(A, transpose(U)))

          enddo

          ! Отправка результата
          call send_result(N, U, NA, result)

          ! Освобождение памяти из-под матриц вращения
          ! и из-под новой матрицы объекта
          call deallocate(U, U_k, NA)

     end procedure apply_jacobi_silent
     
end submodule apply_jacobi_silent_s