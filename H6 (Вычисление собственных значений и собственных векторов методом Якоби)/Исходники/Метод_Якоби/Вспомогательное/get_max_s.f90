submodule ( jacobi_m ) get_max_s ! Подмодуль, содержащий процедуру, возвращающую
                                 ! максимум среди внедиагональных
                                 ! элементов матрицы, а также его индексы
implicit none
     
     contains
     
     ! Процедура, возвращающая максимум среди внедиагональных
     ! элементов матрицы, а также его индексы
     module procedure get_max
          
          ! Вспомогательные переменные
          integer(JP) :: i, j

          max%value = matrix(N_JP, N_JP - 1_JP)

          ! Поиск внедиагонального максимума
          rows_cycle : do j = 1_JP, N_JP - 2_JP

               cols_cycle : do i = j + 1_JP, N_JP

                    if ( matrix(i, j) .gt. max%value ) then

                         max%value = matrix(i, j)
                         max%i = i
                         max%j = j

                    endif

               enddo cols_cycle

          enddo rows_cycle

     end procedure get_max
     
end submodule get_max_s