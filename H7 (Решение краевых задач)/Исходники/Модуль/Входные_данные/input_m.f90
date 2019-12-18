module input_m ! Модуль, содержащий тип входных данных и процедуры,
               ! связанные с объектами этого типа 
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & UP    ! Точность целого числа номера дескриптора файла
use input_errors_m, only : log_input_error ! Процедура для вывода ошибок для других процедур,
                                           ! связанных с входными данными
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use functions_m, only : p, q, f ! Соответствующие функции из условия задачи
implicit none
     
     private
     public :: input_type, & ! Тип, определяющий входные данные
             & p, q, f,    & ! Соответствующие функции из условия задачи
             & read_input    ! Процедура для считывания входных данных

     ! Тип, определяющий входные данные
     type input_type

          private
          
          real(RP) :: l ! Левая граница промежутка
          real(RP) :: r ! Правая граница промежутка

          integer(IP) :: n ! Число разбиений промежутка
          
          ! Параметры, определяющие краевые условия
          real(RP) :: alpha_1, beta_1, gamma_1, alpha_2, beta_2, gamma_2

          contains

          procedure :: get_l ! Функция для получения указателя на значение левой границы промежутка
          procedure :: get_r ! Функция для получения указателя на значение правой границы промежутка

          procedure :: get_n_pt ! Функция для получения указателя на значение числа разбиений промежутка

          procedure :: get_alpha_1 ! Функция для получения указателя на значение параметра alpha_1
          procedure :: get_beta_1  ! Функция для получения значения параметра beta_1
          procedure :: get_gamma_1 ! Функция для получения значения параметра gamma_1
          procedure :: get_alpha_2 ! Функция для получения указателя на значение параметра alpha_2
          procedure :: get_beta_2  ! Функция для получения указателя на значение параметра beta_2
          procedure :: get_gamma_2 ! Функция для получения указателя на значение параметра gamma_2

          procedure :: get_beta_1_pt  ! Функция для получения указателя на значение параметра beta_1
          procedure :: get_gamma_1_pt ! Функция для получения указателя на значение параметра gamma_1

          procedure :: put_l ! Процедура для указания значения левой границы промежутка
          procedure :: put_r ! Процедура для указания значения правой границы промежутка
          
          procedure :: put_alpha_1 ! Процедура для указания значения параметра alpha_1
          procedure :: put_beta_1  ! Процедура для указания значения параметра beta_1
          procedure :: put_gamma_1 ! Процедура для указания значения параметра gamma_1
          procedure :: put_alpha_2 ! Процедура для указания значения параметра alpha_2
          procedure :: put_beta_2  ! Процедура для указания значения параметра beta_2
          procedure :: put_gamma_2 ! Процедура для указания значения параметра gamma_2
          
     end type input_type

     interface
     
          ! Процедура для считывания входных данных
          module impure elemental subroutine read_input(input, settings, file)
          implicit none
          
               type ( input_type ), intent(out) :: input ! Входные данные
               type ( settings_type ), intent(in) :: settings ! Настройки программы
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_input

          ! Функция для получения значения левой границы промежутка
          module impure function get_l(input) result(l)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP) :: l ! Значение левой границы промежутка
               
          end function get_l

          ! Функция для получения значения правой границы промежутка
          module impure function get_r(input) result(r)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP) :: r ! Значение правой границы промежутка
               
          end function get_r

          ! Функция для получения указателя на значение числа разбиений промежутка
          module impure function get_n_pt(input) result(n_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               integer(IP), pointer :: n_pt ! Указатель на значение числа разбиений промежутка
               
          end function get_n_pt

          ! Функция для получения указателя на значение alpha_1
          module impure function get_alpha_1(input) result(alpha_1_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: alpha_1_pt ! Указатель на значение параметра alpha_1
               
          end function get_alpha_1

          ! Функция для получения указателя на значение beta_1
          module impure function get_beta_1_pt(input) result(beta_1_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: beta_1_pt ! Указатель на значение параметра beta_1
               
          end function get_beta_1_pt

          ! Функция для получения значения beta_1
          module impure function get_beta_1(input) result(beta_1)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP) :: beta_1 ! Значение параметра beta_1
               
          end function get_beta_1

          ! Функция для получения указателя на значение gamma_1
          module impure function get_gamma_1_pt(input) result(gamma_1_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: gamma_1_pt ! Указатель на значение параметра gamma_1
               
          end function get_gamma_1_pt

          ! Функция для получения значения gamma_1
          module impure function get_gamma_1(input) result(gamma_1)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP) :: gamma_1 ! Значение параметра gamma_1
               
          end function get_gamma_1

          ! Функция для получения указателя на значение alpha_1
          module impure function get_alpha_2(input) result(alpha_2_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: alpha_2_pt ! Указатель на значение параметра alpha_2
               
          end function get_alpha_2

          ! Функция для получения указателя на значение beta_2
          module impure function get_beta_2(input) result(beta_2_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: beta_2_pt ! Указатель на значение параметра beta_2
               
          end function get_beta_2

          ! Функция для получения указателя на значение gamma_2
          module impure function get_gamma_2(input) result(gamma_2_pt)
          implicit none
               
               class ( input_type ), target, intent(in) :: input ! Входные данные
               real(RP), pointer :: gamma_2_pt ! Указатель на значение параметра gamma_2
               
          end function get_gamma_2

          ! Процедура для указания значения левой границы промежутка
          module pure subroutine put_l(input, l)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: l ! Значение левой границы промежутка
               
          end subroutine put_l

          ! Процедура для указания значения правой границы промежутка
          module pure subroutine put_r(input, r)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: r ! Значение правой границы промежутка
               
          end subroutine put_r

          ! Процедура для указания значения параметра alpha_1
          module pure subroutine put_alpha_1(input, alpha_1)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: alpha_1 ! Значение параметра alpha_1
               
          end subroutine put_alpha_1

          ! Процедура для указания значения параметра beta_1
          module pure subroutine put_beta_1(input, beta_1)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: beta_1 ! Значение параметра beta_1
               
          end subroutine put_beta_1

          ! Процедура для указания значения параметра gamma_1
          module pure subroutine put_gamma_1(input, gamma_1)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: gamma_1 ! Значение параметра gamma_1
               
          end subroutine put_gamma_1

          ! Процедура для указания значения параметра alpha_2
          module pure subroutine put_alpha_2(input, alpha_2)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: alpha_2 ! Значение параметра alpha_2
               
          end subroutine put_alpha_2

          ! Процедура для указания значения параметра beta_2
          module pure subroutine put_beta_2(input, beta_2)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: beta_2 ! Значение параметра beta_2
               
          end subroutine put_beta_2

          ! Процедура для указания значения параметра gamma_2
          module pure subroutine put_gamma_2(input, gamma_2)
          implicit none
               
               class ( input_type ), intent(inout) :: input ! Входные данные
               real(RP), intent(in) :: gamma_2 ! Значение параметра gamma_2
               
          end subroutine put_gamma_2
     
     end interface
     
end module input_m
