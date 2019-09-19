module rtype ! Модуль с параметром, указывающим тип вещественных чисел
implicit none

     private
     public :: rt ! Тип вещественных чисел, используемых в программе

     ! Тип вещественных чисел, используемых в программе
     integer(1), parameter :: rt = 8

end module rtype