module settings_m ! Модуль, содержащий тип настроек программы и процедуры,
                  ! связанные с объектами этого типа
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & UP, & ! Точность целого числа номера дескриптора файла
                 & LP    ! Число байт для хранения логической переменной
use settings_errors_m, only : log_settings_error ! Процедура для вывода ошибок для 
                                                 ! других процедур, связанных с настройками
implicit none
     
     private
     public :: settings_type, & ! Тип, определяющий настройки программы
             & read_settings    ! Процедура для считывания настроек программы
     
     ! Тип, определяющий настройки программы
     type settings_type

          private

          ! Считывать значение левой границы промежутка?
          logical(LP) :: do_read_l

          ! Считывать значение правой границы промежутка?
          logical(LP) :: do_read_r

          ! Считывать значение параметра alpha_1?
          logical(LP) :: do_read_alpha_1

          ! Считывать значение параметра beta_1?
          logical(LP) :: do_read_beta_1

          ! Считывать значение параметра gamma_1?
          logical(LP) :: do_read_gamma_1

          ! Считывать значение параметра alpha_2?
          logical(LP) :: do_read_alpha_2

          ! Считывать значение параметра beta_2?
          logical(LP) :: do_read_beta_2

          ! Считывать значение параметра gamma_2?
          logical(LP) :: do_read_gamma_2

          ! Величина малости для входных параметров 
          ! alpha_1, beta_1, alpha_2 и beta_2
          real(RP) :: input_params_err

          ! Показывать вывод при определении родов граничных условий?
          logical(LP) :: do_show_bvp_solver_output

          ! Показывать вывод на итерациях метода стрельбы?
          logical(LP) :: do_show_shooting_output

          contains

          procedure :: get_do_read_l ! Функция для получения указателя на ответ на вопрос:
                                     ! считывать значение левой границы промежутка?

          procedure :: get_do_read_r ! Функция для получения указателя на ответ на вопрос:
                                     ! считывать значение правой границы промежутка?

          procedure :: get_do_read_alpha_1 ! Функция для получения указателя на ответ на вопрос:
                                           ! считывать значение параметра alpha_1?

          procedure :: get_do_read_beta_1 ! Функция для получения указателя на ответ на вопрос:
                                          ! считывать значение параметра beta_1?

          procedure :: get_do_read_gamma_1 ! Функция для получения указателя на ответ на вопрос:
                                           ! считывать значение параметра gamma_1?

          procedure :: get_do_read_alpha_2 ! Функция для получения указателя на ответ на вопрос:
                                           ! считывать значение параметра alpha_2?

          procedure :: get_do_read_beta_2 ! Функция для получения указателя на ответ на вопрос:
                                          ! считывать значение параметра beta_2?

          procedure :: get_do_read_gamma_2 ! Функция для получения указателя на ответ на вопрос:
                                           ! считывать значение параметра gamma_2?

          procedure :: get_input_params_err ! Функция для получения указателя на величину малости
                                            ! для входных параметров alpha_1, beta_1, alpha_2 и beta_2

          procedure :: get_do_show_bvp_solver_output ! Функция для получения указателя на ответ на вопрос:
                                                     ! показывать вывод при определении родов граничных условий?

          procedure :: get_do_show_shooting_output ! Функция для получения указателя на ответ на вопрос:
                                                   ! показывать вывод на итерациях метода стрельбы?

     end type settings_type

     interface
     
          ! Процедура для считывания настроек программы
          module impure elemental subroutine read_settings(settings, file)
          implicit none
          
               type ( settings_type ), intent(out) :: settings ! Настройки программы
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_settings

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение левой границы промежутка?
          module impure function get_do_read_l(settings) result(do_read_l_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_l_pt ! Считывать значение левой границы промежутка?
          
          end function get_do_read_l

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение правой границы промежутка?
          module impure function get_do_read_r(settings) result(do_read_r_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_r_pt ! Считывать значение правой границы промежутка?
          
          end function get_do_read_r

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение параметра alpha_1?
          module impure function get_do_read_alpha_1(settings) result(do_read_alpha_1_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_alpha_1_pt ! Считывать значение параметра alpha_1?
          
          end function get_do_read_alpha_1

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение параметра beta_1?
          module impure function get_do_read_beta_1(settings) result(do_read_beta_1_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_beta_1_pt ! Считывать значение параметра beta_1?
          
          end function get_do_read_beta_1

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение параметра gamma_1?
          module impure function get_do_read_gamma_1(settings) result(do_read_gamma_1_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_gamma_1_pt ! Считывать значение параметра gamma_1?
          
          end function get_do_read_gamma_1

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение параметра alpha_2?
          module impure function get_do_read_alpha_2(settings) result(do_read_alpha_2_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_alpha_2_pt ! Считывать значение параметра alpha_2?
          
          end function get_do_read_alpha_2

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение параметра beta_2?
          module impure function get_do_read_beta_2(settings) result(do_read_beta_2_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_beta_2_pt ! Считывать значение параметра beta_2?
          
          end function get_do_read_beta_2

          ! Функция для получения указателя на ответ на вопрос:
          ! считывать значение параметра gamma_2?
          module impure function get_do_read_gamma_2(settings) result(do_read_gamma_2_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_read_gamma_2_pt ! Считывать значение параметра gamma_2?
          
          end function get_do_read_gamma_2

          ! Функция для получения указателя на величину малости
          ! для входных параметров alpha_1, beta_1, alpha_2 и beta_2
          module impure function get_input_params_err(settings) result(input_params_err_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               real(RP), pointer :: input_params_err_pt ! Указатель на величину малости
          
          end function get_input_params_err

          ! Функция для получения указателя на ответ на вопрос:
          ! показывать вывод при определении родов граничных условий?
          module impure function get_do_show_bvp_solver_output(settings) result(do_show_bvp_solver_output_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_show_bvp_solver_output_pt ! Показывать вывод при определении родов граничных условий?
          
          end function get_do_show_bvp_solver_output

          ! Функция для получения указателя на ответ на вопрос:
          ! показывать вывод на итерациях метода стрельбы?
          module impure function get_do_show_shooting_output(settings) result(do_show_shooting_output_pt)
          implicit none
          
               class ( settings_type ), target, intent(in) :: settings ! Настройки программы
               logical(LP), pointer :: do_show_shooting_output_pt ! Показывать вывод на итерациях метода стрельбы?
          
          end function get_do_show_shooting_output
     
     end interface
     
end module settings_m
