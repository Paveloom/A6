module function ! Модуль, содержащий функцию, описывающую правую часть дифференциального уравнения
use prec, only : rp ! Точность вещественных чисел, используемых в программе
implicit none
     
     private
     public :: f ! Функция, описывающая правую часть дифференциального уравнения
     
     contains
     
     ! Функция, описывающая правую часть дифференциального уравнения
     real(rp) pure elemental function f(x, y)
          
          ! Аргументы функции
          real(rp), intent(in) :: x, y
          
          f = exp(x) - y

     end function f
     
end module function