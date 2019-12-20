module result_m ! Модуль, содержащий тип результата и процедуры,
                ! связанные с объектами этого типа
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & JP, & ! Точность целого числа счетчика
                 & SP, & ! Точность целого числа статусной переменной
                 & FP    ! Число байт для хранения вспомогательной строки
use input_m, only : input_type ! Тип входных данных
use settings_m, only : settings_type ! Тип настроек программы
use result_errors_m, only : log_result_error ! Процедура для вывода ошибок для других процедур, 
                                             ! связанных с результатом
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий результат
             & allocate_result, & ! Процедура для выделения памяти под массивы результата
             & deallocate_result, & ! Процедура для освобождения памяти из-под результата
             & write ! Процедура для вывода результата
     
     type result_type

          private

          real(RP), allocatable, dimension(:) :: x ! Массив узловых точек
          real(RP), allocatable, dimension(:) :: y ! Массив значений искомой функции
          real(RP), allocatable, dimension(:) :: z ! Массив значений производной искомой функции

          integer(IP) :: method_number ! Номер метода для решения краевой задачи

          contains

          procedure :: get_x_pt ! Функция для получения указателя на массив узловых точек
          procedure :: get_y_pt ! Функция для получения указателя на массив значений искомой функции
          procedure :: get_z_pt ! Функция для получения указателя на массив значений производной искомой функции

          procedure :: put_method_number_result ! Процедура для указания значения номера метода для решения краевой задачи
          procedure :: get_method_number_result ! Функция для получения указателя на номер метода для решения краевой задачи

     end type result_type

     interface

          ! Процедура для выделения памяти под массивы результата
          module impure elemental subroutine allocate_result(input, settings, result)
          implicit none
               
               type ( input_type ), intent(in) :: input ! Входные данные
               type ( settings_type ), intent(in) :: settings ! Настройки программы
               type ( result_type ), intent(inout) :: result ! Результат

          end subroutine allocate_result
     
          ! Функция для получения указателя на массив узловых точек
          module impure function get_x_pt(result) result(x_pt)
          implicit none
               
               class ( result_type ), target, intent(in) :: result ! Результат
               real(RP), pointer, dimension(:) :: x_pt ! Указатель на массив узловых точек

          end function get_x_pt

          ! Функция для получения указателя на массив значений искомой функции
          module impure function get_y_pt(result) result(y_pt)
          implicit none
               
               class ( result_type ), target, intent(in) :: result ! Результат
               real(RP), pointer, dimension(:) :: y_pt ! Указатель на массив значений искомой функции

          end function get_y_pt

          ! Функция для получения указателя на массив значений производной искомой функции
          module impure function get_z_pt(result) result(z_pt)
          implicit none
               
               class ( result_type ), target, intent(in) :: result ! Результат
               real(RP), pointer, dimension(:) :: z_pt ! Указатель на массив значений производной искомой функции

          end function get_z_pt

          ! Процедура для указания значения номера метода для решения краевой задачи
          module impure subroutine put_method_number_result(result, method_number)
          implicit none
               
               class ( result_type ), intent(inout) :: result ! Результат
               integer(IP), intent(in) :: method_number ! Номер метода для решения краевой задачи

          end subroutine put_method_number_result

          ! Функция для получения указателя на номер метода для решения краевой задачи
          module impure function get_method_number_result(result) result(method_number_pt)
          implicit none
               
               class ( result_type ), target, intent(in) :: result ! Результат
               integer(IP), pointer :: method_number_pt ! Указатель на номер метода для решения краевой задачи

          end function get_method_number_result

          ! Процедура для вывода результата
          module impure elemental subroutine write(result)
          implicit none

               type ( result_type ), intent(in) :: result ! Результат

          end subroutine write
     
          ! Процедура для освобождения памяти из-под результата
          module impure elemental subroutine deallocate_result(result)
          implicit none
          
               type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine deallocate_result

     end interface
     
end module result_m