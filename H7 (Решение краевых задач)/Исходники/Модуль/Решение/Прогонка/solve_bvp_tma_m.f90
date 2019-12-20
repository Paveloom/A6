module solve_bvp_tma_m ! Модуль, содержащий процедуры, относящиеся к
                       ! методу прогонки для решения краевой задачи
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP    ! Точность целого числа счетчика и индекса
use input_m, only : input_type, & ! Тип входных данных
                  & p, q, f ! Соответствующие функции из условия задачи
use settings_m, only : settings_type ! Тип настроек программы
use result_m, only : result_type ! Тип результата
use bvp_errors_m, only : log_bvp_error ! Процедура для вывода ошибок для других процедур,
                                       ! связанных с получением решения для краевой задачи
implicit none
     
     private
     public :: solve_bvp_tma ! Процедура метода прогонки
     
     interface
     
          ! Процедура метода прогонки
          module impure subroutine solve_bvp_tma(input, settings, result)
          implicit none
          
          type ( input_type ), intent(in) :: input ! Входные данные
          type ( settings_type ), intent(in) :: settings ! Настройки программы
          type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine solve_bvp_tma
     
     end interface

end module solve_bvp_tma_m