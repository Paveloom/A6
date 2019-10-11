module input_warns_m ! Модуль, содержащий процедуру для вывода ошибок для
                     ! других процедур, связанных с входными данными
implicit none
     
     private
     public :: log_input_error ! Процедура для вывода ошибок для других процедур,
                               ! связанных с входными данными
     
     interface 
          
          ! Процедура для вывода ошибок для других процедур, связанных с входными данными
          module impure subroutine log_input_error(error_code, file)
          implicit none
               
               character(*), intent(in) :: error_code
               character(*), intent(in), optional :: file

          end subroutine log_input_error
     
     end interface

end module input_warns_m