module bvp_errors_m ! Модуль, содержащий процедуру для вывода ошибок для
                      ! других процедур, связанных с получением решения 
                      ! для краевой задачи
implicit none
     
     private
     public :: log_bvp_error ! Процедура для вывода ошибок для других процедур,
                             ! связанных с получением решения для краевой задачи
     
     interface 
          
          ! Процедура для вывода ошибок для других процедур,
          ! связанных с получением решения для краевой задачи
          module impure subroutine log_bvp_error(error_code)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки

          end subroutine log_bvp_error
     
     end interface

end module bvp_errors_m