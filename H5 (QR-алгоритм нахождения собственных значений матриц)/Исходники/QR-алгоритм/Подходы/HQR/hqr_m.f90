module hqr_m ! Модуль, содержащий процедуры, реализующие
             ! QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика
                 & FP, & ! Число байт для хранения вспомогательной строки
                 & LP    ! Число байт для хранения логической переменной
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use givens_rotations_m, only : get_givens_rotation_coefs
implicit none
     
     private
     public :: hqr_alg_with_rayleigh_quotient_shift ! Процедура общего вызова процедур, 
                                                    ! реализующих QR-алгоритм Хаусхолдера
                                                    ! со сдвигом по отношению Релея
     
     interface

          ! Процедура общего вызова процедур, 
          ! реализующих QR-алгоритм Хаусхолдера
          ! со сдвигом по отношению Релея
          module impure subroutine hqr_alg_with_rayleigh_quotient_shift(input, result, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine hqr_alg_with_rayleigh_quotient_shift

          ! Процедура, реализующая QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
          ! (с дополнительным выводом)
          module impure subroutine hqr_alg_with_rayleigh_quotient_shift_loud(input, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine hqr_alg_with_rayleigh_quotient_shift_loud

          ! Процедура, реализующая QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
          ! (без дополнительного вывода)
          module pure subroutine hqr_alg_with_rayleigh_quotient_shift_silent(input, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine hqr_alg_with_rayleigh_quotient_shift_silent

          ! Процедура, выполняющая шаг QR-разложения
          ! и RQ-композиции для матрицы Хессенберга
          module pure subroutine make_a_hessenberg_qr_step(input, m) 
          implicit none
                    
               type ( input_type ), intent(inout) :: input ! Входные данные
               integer(JP), intent(in) :: m ! Активный размер матрицы
                         
          end subroutine make_a_hessenberg_qr_step
     
     end interface

end module hqr_m