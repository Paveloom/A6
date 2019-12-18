module functions_m ! Модуль, описывающий функции p, q и f при задании
                   ! условия задачи (создается скриптом на основе
                   ! текстового файла functions в корне)
use prec_m, only : RP ! Точность вещественных чисел, используемых в программе
implicit none
     
     private
     public :: p, q, f ! Соответствующие функции из условия задачи
     
     contains

     real(RP) pure elemental function p(x)
     real(RP), intent(in) :: x ! Аргумент функции

          p = -3.d0
          
     end function p

     real(RP) pure elemental function q(x)
     real(RP), intent(in) :: x ! Аргумент функции

          q = 2.d0
          
     end function q

     real(RP) pure elemental function f(x)
     real(RP), intent(in) :: x ! Аргумент функции

          f = -2.d0 * sin(x)
          
     end function f
     
end module functions_m
