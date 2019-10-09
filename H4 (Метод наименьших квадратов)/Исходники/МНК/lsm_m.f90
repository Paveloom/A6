module lsm_m ! Модуль, содержащий процедуру для общего вызова метода
             ! наименьших квадратов
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP    ! Точность целого числа статусной переменной
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use lsm_warns_m, only : log_lsm_error ! Процедура для вывода ошибок для модулей, 
                                      ! связанных с вызовами метода наименьших квадратов
implicit none
     
     private
     public :: lsm ! Процедура для общего вызова метода наименьших квадратов
     
     interface
     
          ! Процедура для общего вызова метода наименьших квадратов
          module subroutine lsm(input, result)
          implicit none
          
          type ( input_type ), intent(in) :: input
          type ( result_type ), intent(inout) :: result
          
          end subroutine lsm

          ! Процедура для вызова метода наименьших квадратов для линейной функции
          module subroutine lsm_linear(input, result)
          implicit none
          
          type ( input_type ), intent(in) :: input
          type ( result_type ), intent(inout) :: result
          
          end subroutine lsm_linear

          ! Процедура для вызова метода наименьших квадратов для гиперболической функции
          module subroutine lsm_hyperbolic(input, result)
          implicit none
          
          type ( input_type ), intent(in) :: input
          type ( result_type ), intent(inout) :: result
          
          end subroutine lsm_hyperbolic
     
     end interface  

end module lsm_m