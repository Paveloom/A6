submodule ( jacobi_m ) apply_jacobi_s ! Подмодуль, содержащий процедуру, реализующую
                                             ! метод Якоби для поиска собственных значений и
                                             ! векторов симметричных матриц
implicit none
     
     contains
     
     ! Процедура, реализующая метод Якоби для поиска
     ! собственных значений и векторов симметричных матриц
     module procedure apply_jacobi

          ! Внедиагональный максимум и его индексы
          type ( max_type ) max

          ! Указатель на число строк матрицы
          integer(IP), pointer :: N

          ! Число строк матрицы (на точности JP)
          integer(JP) :: N_JP

          ! Указатель на матрицу объекта
          real(RP), dimension(:,:), pointer :: matrix

          integer(JP) :: k ! Счетчик итераций

          ! Распаковка объекта
          N => input%get_N()
          matrix => input%get_matrix()

          ! Конвертация
          N_JP = int(N, kind = JP)
          
          ! Проверка, является ли матрица симметричной
          call test_if_the_matrix_is_symmetric(N_JP, matrix)

          do k = 1_JP, 100_JP

               ! Получение внедигонального максимума
               call get_max(N_JP, matrix, max)

          enddo
          
     end procedure apply_jacobi
     
end submodule apply_jacobi_s