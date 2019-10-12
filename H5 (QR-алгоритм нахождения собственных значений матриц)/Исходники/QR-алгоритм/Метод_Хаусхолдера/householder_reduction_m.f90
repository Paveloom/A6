module householder_reduction_m ! Модуль, содержащий процедуру, реализующую
                               ! метод Хаусхолдера для приведения исходной матрицы
                               ! к матрице Хессенберга (почти треугольной матрице)
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & JP, & ! Точность целого числа счетчика
                 & FP, & ! Число байт для хранения вспомогательной строки
                 & LP    ! Число байт для хранения логической переменной
use input_m, only : input_type ! Тип, определяющий входные данные
use settings_m, only : settings_type ! Тип, определяющий настройки программы
implicit none
     
     private
     public :: get_hessenberg_form ! Процедура для общего вызова процедуры, реализующей
                                   ! метод Хаусхолдера для приведения исходной матрицы к 
                                   ! матрице Хессенберга (почти треугольной матрице)
     
     interface
     
          ! Процедура для общего вызова процедуры, реализующей
          ! метод Хаусхолдера для приведения исходной матрицы к 
          ! матрице Хессенберга (почти треугольной матрице)
          module impure subroutine get_hessenberg_form(input, settings)
          implicit none
          
          type ( input_type ), intent(inout) :: input    ! Входные данные
          type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine get_hessenberg_form

          ! Процедура, реализующая метод Хаусхолдера для приведения исходной
          ! матрицы к матрице Хессенберга (почти треугольной матрице)
          ! с дополнительным выводом
          module impure subroutine get_hessenberg_form_loud(input)
          implicit none
          
          type ( input_type ), intent(inout) :: input ! Входные данные
          
          end subroutine get_hessenberg_form_loud

          ! Процедура, реализующая метод Хаусхолдера для приведения исходной
          ! матрицы к матрице Хессенберга (почти треугольной матрице)
          ! без дополнительного вывода
          module pure subroutine get_hessenberg_form_silent(input)
          implicit none
          
          type ( input_type ), intent(inout) :: input ! Входные данные
          
          end subroutine get_hessenberg_form_silent
     
     end interface
     
     
end module householder_reduction_m