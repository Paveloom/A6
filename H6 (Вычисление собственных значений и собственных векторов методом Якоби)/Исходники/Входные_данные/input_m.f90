module input_m ! Модуль, содержащий тип входных данных и процедуры,
               ! связанные с объектами этого типа 
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
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
          
          integer(IP) :: N ! Число строк матрицы
          real(RP), allocatable, dimension(:,:) :: matrix ! Матрица объекта

          contains

          procedure :: get_N ! Функция для получения цказателя на число строк матрицы
          procedure :: get_matrix ! Функция для получения указателя на матрицу объекта
          
     end type input_type

     interface
     
          ! Процедура для выделения памяти / считывания входных данных
          module impure elemental subroutine read_input(input, file)
          implicit none
          
               type ( input_type ), intent(out) :: input ! Входные данные
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_input

          ! Функция для получения указателя на число строк матрицы
          module impure function get_N(input) result(N)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               integer(IP), pointer :: N ! Указатель на число строк матрицы
               
          end function get_N

          ! Функция для получения указателя на матрицу объекта
          module impure function get_matrix(input) result(matrix)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), dimension(:,:), pointer, contiguous :: matrix ! Указатель на матрицу объекта
               
          end function get_matrix

          ! Процедура для освобождения памяти из-под входных данных
          module impure elemental subroutine deallocate_input(input)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
          
          end subroutine deallocate_input
     
     end interface
     
end module input_m