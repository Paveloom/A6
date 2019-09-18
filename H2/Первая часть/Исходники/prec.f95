module prec ! Модуль с параметром, указывающим тип вещественных чисел
implicit none

     private
     public :: rp ! Тип вещественных чисел, используемых в программе

     ! Тип вещественных чисел, используемых в программе
     integer(1), parameter :: rp = 8

end module prec