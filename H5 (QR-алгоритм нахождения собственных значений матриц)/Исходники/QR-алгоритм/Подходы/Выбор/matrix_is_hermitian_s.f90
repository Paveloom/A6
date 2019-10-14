submodule ( matrix_checks_m ) matrix_is_hermitian_s ! Подмодуль, содержащий функцию для
                                                    ! проверки, является ли матрица эрмитовой
implicit none
     
     contains
     
     ! Функция для проверки, является ли матрица эрмитовой
     module procedure matrix_is_hermitian
          
          ! Вспомогательные переменные
          integer(JP) :: i, j

          is_it = .true.

          rows_check : do i = 1_JP, input%N - 1_JP

               columns_check : do j = i + 1_JP, input%N

               if ( input%matrix(j, i) .ne. conjg(input%matrix(i, j)) ) then
                    
                    is_it = .false.
                    exit rows_check

               endif

               enddo columns_check

          enddo rows_check 
          
     end procedure matrix_is_hermitian
     
end submodule matrix_is_hermitian_s