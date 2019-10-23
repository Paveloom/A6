module jacobi_warns_m ! Модуль, содержащий процедуру для вывода ошибок для
                      ! других процедур, связанных с методом Якоби
implicit none
     
     private
     public :: log_jacobi_error ! Процедура для вывода ошибок для других процедур,
                                ! связанных с методом Якоби
     
     interface 
          
          ! Процедура для вывода ошибок для других процедур, связанных с методом Якоби
          module impure subroutine log_jacobi_error(error_code)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки

          end subroutine log_jacobi_error
     
     end interface

end module jacobi_warns_m