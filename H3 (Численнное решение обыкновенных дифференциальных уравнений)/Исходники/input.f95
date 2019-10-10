module input ! Модуль, отвечающий за процедуры считывания данных
use prec, only : rp, & ! Точность вещественных чисел, используемых в программе
               & ip    ! Точность целых чисел, используемых в программе
implicit none
     
     private
     public :: input_type, & ! Тип, определяющий входные данные
             & read ! Процедура для считывания начальных данных
     
     ! Тип, определяющий входные данные
     type input_type
          
          integer(ip) :: N ! Число узлов, вычисляемых методами
          real(rp) :: x_0, y_0 ! Начальные данные
          real(rp) :: x_N ! Значение правой границы отрезка
          
     end type input_type

     contains
     
     ! Процедура для считывания начальных данных
     subroutine read(input) 
          
          type ( input_type ), intent(out) :: input ! Входные данные

          read(*,'()'); read(*,*) input%N ! Считывание числа узлов, вычисляемых методами
          read(*,'(/)'); read(*,*) input%x_0, input%y_0 ! Считывание начальных данных
          read(*,'(/)'); read(*,*) input%x_N ! Считывание значения правой границы отрезка

     end subroutine read
     
end module input