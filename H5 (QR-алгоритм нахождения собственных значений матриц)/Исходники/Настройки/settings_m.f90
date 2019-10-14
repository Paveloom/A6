module settings_m ! Модуль, содержащий тип настроек программы и процедуры,
                  ! связанные с объектами этого типа
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & UP, & ! Точность целого числа номера дескриптора файла
                 & LP    ! Число байт для хранения логической переменной
use settings_warns_m, only : log_settings_error ! Процедура для вывода ошибок для 
                                                ! других процедур, связанных с настройками
implicit none
     
     private
     public :: settings_type, & ! Тип, определяющий настройки программы
             & read_settings    ! Процедура для считывания настроек программы
     
     ! Тип, определяющий настройки программы
     type settings_type

          private

          ! Показывать реализацию метода Хаусхолдера?
          logical(LP) :: do_show_householder_reduction

          ! Ограничение сверху на значение |matrix(m - 1, m)|
          ! для одной итерации QR-алгоритма Хаусхолдера 
          ! со сдвигом по отношению Релея (условие сходимости)
          real(RP) :: hqr_err

          ! Значение эпсилон для QR-алгоритма Фрэнсиса
          ! с двойным сдвигом (условие сходимости)
          real(RP) :: fqr_err

          contains

          procedure :: get_Q1_answer => get_do_show_householder_reduction ! Функция для получения ответа на вопрос:
                                                                          ! показывать реализацию метода Хаусхолдера?
          procedure :: get_hqr_err ! Функция для получения условия сходимости
                                   ! для QR-алгоритма Хаусхолдера
          procedure :: get_fqr_err ! Функция для получения условия сходимости
                                   ! для QR-алгоритма Фрэнсиса

     end type settings_type

     interface
     
          ! Процедура для считывания настроек программы
          module impure elemental subroutine read_settings(settings, file)
          implicit none
          
               type ( settings_type ), intent(out) :: settings ! Настройки программы
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_settings

          ! Функция для получения ответа на вопрос:
          ! показывать реализацию метода Хаусхолдера?
          module pure function get_do_show_householder_reduction(settings) result(do_show_householder_reduction)
          implicit none
          
               class ( settings_type ), intent(in) :: settings ! Настройки программы
               logical(LP) :: do_show_householder_reduction ! Показывать реализацию метода Хаусхолдера?
          
          end function get_do_show_householder_reduction

          ! Функция для получения условия сходимости
          ! для QR-алгоритма Хаусхолдера
          module pure function get_hqr_err(settings) result(hqr_err)
          implicit none
          
               class ( settings_type ), intent(in) :: settings ! Настройки программы
               real(RP) :: hqr_err ! Ограничение сверху на значение |matrix(m - 1, m)|
                                   ! для одной итерации QR-алгоритма Хаусхолдера 
                                   ! со сдвигом по отношению Релея (условие сходимости)
          
          end function get_hqr_err

          ! Функция для получения условия сходимости
          ! для QR-алгоритма Фрэнсиса
          module pure function get_fqr_err(settings) result(fqr_err)
          implicit none
               
               class ( settings_type ), intent(in) :: settings ! Настройки программы
               real(RP) :: fqr_err ! Значение эпсилон для QR-алгоритма Фрэнсиса
                                   ! с двойным сдвигом (условие сходимости)
               
          end function get_fqr_err
     
     end interface
     
end module settings_m