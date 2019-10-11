module result_warns_m ! Модуль, содержащий процедуру для вывода ошибок для
                      ! других процедур, связанных с результатом
implicit none
     
     private
     public :: log_result_error ! Процедура для вывода ошибок для других процедур,
                                ! связанных с результатом
     
     interface 
          
          ! Процедура для вывода ошибок для других процедур, связанных с результатом
          module impure subroutine log_result_error(error_code)
          implicit none

               character(*), intent(in) :: error_code

          end subroutine log_result_error
     
     end interface

end module result_warns_m