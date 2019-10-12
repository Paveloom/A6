module settings_warns_m ! Модуль, содержащий процедуру для вывода ошибок для
                        ! других процедур, связанных с настройками
implicit none
     
     private
     public :: log_settings_error ! Процедура для вывода ошибок для других процедур,
                                ! связанных с настройками
     
     interface 
          
          ! Процедура для вывода ошибок для других процедур, связанных с настройками
          module impure subroutine log_settings_error(error_code, file)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine log_settings_error
     
     end interface

end module settings_warns_m