module lsm_warns_m ! Модуль, содержащий процедуру для вывода ошибок для модулей,
                   ! связанных с вызовами метода наименьших квадратов
implicit none
     
     private
     public :: log_lsm_error ! Процедура для вывода ошибок для модулей,
                             ! связанных с вызовами метода наименьших квадратов
     
     interface
     
          ! Процедура для вывода ошибок для модулей, связанных с вызовами метода наименьших квадратов
          module impure subroutine log_lsm_error(error_code, file)
          implicit none
          
               character(*), intent(in) :: error_code
               character(*), intent(in), optional :: file
          
          end subroutine log_lsm_error
     
     end interface
     
end module lsm_warns_m