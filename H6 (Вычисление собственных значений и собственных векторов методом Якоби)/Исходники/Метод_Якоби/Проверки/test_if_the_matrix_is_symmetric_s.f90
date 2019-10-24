submodule ( jacobi_m ) test_if_the_matrix_is_symmetric_s ! Подмодуль, содержащий процедуру, проверяющую, 
                                                         ! является ли матрица на входе симметричной
implicit none
     
     contains
     
     ! Процедура, проверяющая, является ли
     ! матрица на входе симметричной
     module procedure test_if_the_matrix_is_symmetric

          ! Вспомогательные переменные
          integer(JP) :: i, j

          ! Проверка, является ли матрица симметричной
          rows_cycle : do j = 1_JP, N%m0 - 1_JP

               cols_cycle : do i = j + 1_JP, N%m0

                    if ( abs(matrix(i, j) - matrix(j, i)) .gt. 1e-8_RP ) then

                         write(*,'(/, 5x, a, /)') 'Матрица не является симметричной. Метод Якоби не будет применен.'

                         stop

                    endif

               enddo cols_cycle

          enddo rows_cycle

     end procedure test_if_the_matrix_is_symmetric
     
end submodule test_if_the_matrix_is_symmetric_s