submodule ( matrix_checks_m ) matrix_is_purely_real_s ! Подмодуль, содержащий функцию для
                                                      ! проверки, является ли матрица вещественной
implicit none
     
     contains
     
     ! Функция для проверки, является ли матрица вещественной
     module procedure matrix_is_purely_real
          
          ! Вспомогательные переменные
          integer(JP) :: i, j

          is_it = .true.

          rows_check : do i = 1_JP, input%N

               columns_check : do j = 1_JP, input%N

               if ( .not. ( abs(aimag(input%matrix(j, i))) .lt. 1e-8_RP ) ) then
                    
                    is_it = .false.
                    exit rows_check

               endif

               enddo columns_check

          enddo rows_check

     end procedure matrix_is_purely_real
     
end submodule matrix_is_purely_real_s