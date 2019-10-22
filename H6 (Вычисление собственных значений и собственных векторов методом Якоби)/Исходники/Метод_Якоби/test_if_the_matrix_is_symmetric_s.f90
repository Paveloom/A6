submodule ( jacobi_m ) test_if_the_matrix_is_symmetric_s ! Подмодуль, содержащий процедуру, проверяющую, 
                                                         ! является ли матрица на входе симметричной
implicit none
     
     contains
     
     ! Процедура, проверяющая, является ли
     ! матрица на входе симметричной
     module procedure test_if_the_matrix_is_symmetric
          
          ! Указатель на матрицу объекта
          real(RP), dimension(:,:), pointer :: matrix

          ! Число строк матрицы
          integer(JP) :: N_JP

          ! Вспомогательные переменные
          integer(JP) :: i, j

          matrix => input%get_matrix()

          ! Конвертация
          N_JP = int(input%get_N(), kind = JP)

          ! Проверка, является ли матрица симметричной
          rows_cycle : do j = 1_JP, N_JP - 1_JP

               cols_cycle : do i = j + 1_JP, N_JP

                    if ( abs(matrix(i, j) - matrix(j, i)) .gt. 1e-8_RP ) then

                         write(*,'(/, 5x, a, /)') 'Матрица не является симметричной. Метод Якоби не будет применен.'

                         stop

                    endif

               enddo cols_cycle

          enddo rows_cycle

     end procedure test_if_the_matrix_is_symmetric
     
end submodule test_if_the_matrix_is_symmetric_s