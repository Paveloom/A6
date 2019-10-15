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
             & read_input, & ! Процедура для выделения памяти / считывания входных данных
             & deallocate_input ! Процедура для освобождения памяти из-под входных данных
     
     ! Тип, определяющий входные данные
     type input_type
          
          private

          integer(IP), public :: N ! Число строк матрицы
          complex(CP), allocatable, dimension(:,:), public :: matrix ! Матрица объекта
          
     end type input_type

     interface
     
          ! Процедура для выделения памяти / считывания входных данных
          module impure elemental subroutine read_input(input, file)
          implicit none
          
          type ( input_type ), intent(out) :: input ! Входные данные
          character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_input

          ! Процедура для освобождения памяти из-под входных данных
          module impure elemental subroutine deallocate_input(input)
          implicit none
          
          type ( input_type ), intent(inout) :: input ! Входные данные
          
          end subroutine deallocate_input
     
     end interface
     
end module input_m