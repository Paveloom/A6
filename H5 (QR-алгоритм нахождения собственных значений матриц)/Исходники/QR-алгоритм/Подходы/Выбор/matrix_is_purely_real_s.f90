submodule ( matrix_checks_m ) matrix_is_purely_real_s ! Подмодуль, содержащий функцию для
                                                      ! проверки, является ли матрица вещественной
implicit none
     
     contains
     
     ! Функция для проверки, является ли матрица вещественной
     module procedure matrix_is_purely_real
          
          ! Число строк матрицы, записанное в целочисленную переменную точности JP
          integer(JP) :: N_JP

          ! Вспомогательные переменные
          integer(JP) :: i, j

          ! Присваивание значения N_JP
          N_JP = int(input%N, kind = JP)

          is_it = .true.

          rows_check : do i = 1_JP, N_JP

               columns_check : do j = 1_JP, N_JP

               if ( .not. ( abs(aimag(input%matrix(j, i))) .lt. 1e-8_RP ) ) then
                    
                    is_it = .false.
                    exit rows_check

               endif

               enddo columns_check

          enddo rows_check

     end procedure matrix_is_purely_real
     
end submodule matrix_is_purely_real_s