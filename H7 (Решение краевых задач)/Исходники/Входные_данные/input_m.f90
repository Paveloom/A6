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
             & read_input    ! Процедура для выделения памяти / считывания входных данных

     ! Тип, определяющий входные данные
     type input_type

          private
          
          real(RP) :: l ! Левая граница промежутка
          real(RP) :: r ! Правая граница промежутка

          integer(RP) :: n ! Число разбиений промежутка
          
          ! Параметры, определяющие краевые условия
          real(RP) :: alpha_1, beta_1, gamma_1, alpha_2, beta_2, gamma_2

          contains

          procedure :: get_l ! Функция для получения указателя на значение левой границы промежутка
          procedure :: get_r ! Функция для получения указателя на значение правой границы промежутка

          procedure :: put_l ! Процедура для указания значения левой границы промежутка
          procedure :: put_r ! Процедура для указания значения правой границы промежутка
          
          procedure :: put_alpha_1 ! Процедура для указания значения параметра alpha_1
          procedure :: put_beta_1 ! Процедура для указания значения параметра beta_1
          procedure :: put_gamma_1 ! Процедура для указания значения параметра gamma_1
          procedure :: put_alpha_2 ! Процедура для указания значения параметра alpha_2
          procedure :: put_beta_2 ! Процедура для указания значения параметра beta_2
          procedure :: put_gamma_2 ! Процедура для указания значения параметра gamma_2
          
     end type input_type

     interface
     
          ! Процедура для выделения памяти / считывания входных данных
          module impure elemental subroutine read_input(input, file)
          implicit none
          
               type ( input_type ), intent(out) :: input ! Входные данные
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_input

          ! Функция для получения указателя на значение левой границы промежутка
          module pure function get_l(input) result(l_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               integer(RP), pointer :: l_pt ! Указатель на значение левой границы промежутка
               
          end function get_l

          ! Функция для получения указателя на значение правой границы промежутка
          module pure function get_r(input) result(r_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: r_pt ! Указатель на значение правой границы промежутка
               
          end function get_r

          ! Процедура для указания значения левой границы промежутка
          module pure subroutine put_l(input, l)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: l ! Значение левой границы промежутка
               
          end subroutine put_l

          ! Процедура для указания значения правой границы промежутка
          module pure subroutine put_r(input, r)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: r ! Значение правой границы промежутка
               
          end subroutine put_r

          ! Процедура для указания значения параметра alpha_1
          module pure subroutine put_alpha_1(input, alpha_1)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: alpha_1 ! Значение параметра alpha_1
               
          end subroutine put_alpha_1

          ! Процедура для указания значения параметра beta_1
          module pure subroutine put_beta_1(input, beta_1)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: beta_1 ! Значение параметра beta_1
               
          end subroutine put_beta_1

          ! Процедура для указания значения параметра gamma_1
          module pure subroutine put_gamma_1(input, gamma_1)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: gamma_1 ! Значение параметра gamma_1
               
          end subroutine put_gamma_1

          ! Процедура для указания значения параметра alpha_2
          module pure subroutine put_alpha_2(input, alpha_2)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: alpha_2 ! Значение параметра alpha_2
               
          end subroutine put_alpha_2

          ! Процедура для указания значения параметра beta_2
          module pure subroutine put_beta_2(input, beta_2)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: beta_2 ! Значение параметра beta_2
               
          end subroutine put_beta_2

          ! Процедура для указания значения параметра gamma_2
          module pure subroutine put_gamma_2(input, gamma_2)
          implicit none
               
               class ( input_type ), intent(in) :: input ! Входные данные
               real(RP) :: gamma_2 ! Значение параметра gamma_2
               
          end subroutine put_gamma_2
     
     end interface
     
end module input_m
