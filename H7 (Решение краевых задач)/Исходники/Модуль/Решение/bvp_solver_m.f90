module bvp_solver_m ! Модуль, описывающий процедуру для представления
                    ! структуры вызовов вариационных процедур 
                    ! и получения результата
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & LP    ! Число байт для хранения логической переменной
use input_m, only : input_type ! Тип входных данных
use settings_m, only : settings_type ! Тип настроек программы
use result_m, only : result_type ! Тип результата
use bvp_errors_m, only : log_bvp_error ! Процедура для вывода ошибок для других процедур, 
                                       ! связанных с получением решения для краевой задачи
use solve_bvp_shooting_m, only : solve_bvp_shooting_choosing ! Процедура для выбора и 
                                                             ! вызова необходимой 
                                                             ! варьирующей процедуры
implicit none
     
     private
     public :: solve_bvp ! Процедура общего вызова для получения решения

     interface
     
          ! Процедура общего вызова для получения решения
          module impure subroutine solve_bvp(input, settings, result)
          implicit none
          
               type ( input_type ), intent(in) :: input ! Тип входных данных
               type ( settings_type ), intent(in) :: settings ! Тип настроек программы
               type ( result_type ), intent(inout) :: result ! Тип результата
          
          end subroutine solve_bvp

          ! Процедура общего вызова для получения решения
          ! (с дополнительным выводом)
          module impure subroutine solve_bvp_loud(input, settings, result)
          implicit none
          
               type ( input_type ), intent(in) :: input ! Тип входных данных
               type ( settings_type ), intent(in) :: settings ! Тип настроек программы
               type ( result_type ), intent(inout) :: result ! Тип результата
          
          end subroutine solve_bvp_loud

          ! Процедура общего вызова для получения решения
          ! (без дополнительного вывода)
          module impure subroutine solve_bvp_quiet(input, settings, result)
          implicit none
          
               type ( input_type ), intent(in) :: input ! Тип входных данных
               type ( settings_type ), intent(in) :: settings ! Тип настроек программы
               type ( result_type ), intent(inout) :: result ! Тип результата
          
          end subroutine solve_bvp_quiet

     end interface
     
end module bvp_solver_m