module lsm_linear_m ! Модуль, содержащий процедуру для вызова
                    ! метода наименьших квадратов для линейной функции
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP    ! Точность целых чисел, используемых в программе
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
implicit none
     
     private
     public :: lsm_linear ! Процедура для вызова метода наименьших
                          ! квадратов для линейной функции
     
     interface
     
          ! Процедура для вызова метода наименьших квадратов для линейной функции
          module subroutine lsm_linear(input, result)
          implicit none
          
          type ( input_type ), intent(in) :: input
          type ( result_type ), intent(inout) :: result
          
          end subroutine lsm_linear
     
     end interface
     
end module lsm_linear_m