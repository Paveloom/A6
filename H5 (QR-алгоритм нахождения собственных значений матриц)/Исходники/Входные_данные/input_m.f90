module input_m ! Модуль, содержащий тип входных данных и процедуры,
               ! связанные с объектами этого типа 
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & UP    ! Точность целого числа номера дескриптора файла
use input_warns_m, only : log_input_error ! Процедура для вывода ошибок для других процедур,
                                          ! связанных с входными данными
implicit none
     
     private
     public :: input_type, & ! Тип, определяющий входные данные
             & read, & ! Процедура для выделения памяти / считывания входных данных
             & deallocate_input ! Процедура для освобождения памяти из-под входных данных
     
     ! Тип, определяющий входные данные
     type input_type
          
          private

          integer(IP) :: N
          complex(CP), allocatable, dimension(:,:), public :: matrix
          
     end type input_type

     interface
     
          ! Процедура для выделения памяти / считывания входных данных
          module impure elemental subroutine read(input, file)
          implicit none
          
          type ( input_type ), intent(out) :: input
          character(*), intent(in) :: file
          
          end subroutine read

          ! Процедура для освобождения памяти из-под входных данных
          module impure elemental subroutine deallocate_input(input)
          implicit none
          
          type ( input_type ), intent(inout) :: input
          
          end subroutine deallocate_input
     
     end interface
     
end module input_m