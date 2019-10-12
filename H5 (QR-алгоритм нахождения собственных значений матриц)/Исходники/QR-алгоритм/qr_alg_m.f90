module qr_alg_m ! Модуль, содержащий процедуры для нахождения значений собственных
                ! чисел квадратных матриц с помощью модифицированного
                ! QR-алгоритма
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & JP    ! Точность целого числа счетчика
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use householder_reduction_m, only : get_hessenberg_form ! Процедура для общего вызова процедуры, реализующей
                                                        ! метод Хаусхолдера для приведения исходной матрицы к 
                                                        ! матрице Хессенберга (почти треугольной матрице)
use givens_rotations_m, only : get_givens_rotation_coefs_loud
implicit none
     
     private
     public :: get_eigenvalues ! Процедура главного вызова модифицированного QR-алгоритма
                               ! для нахождения значений собственных чисел квадратных матриц
     
     interface
     
          ! Процедура главного вызова модифицированного QR-алгоритма
          ! для нахождения значений собственных чисел квадратных матриц
          module impure subroutine get_eigenvalues(input, result, settings)
          implicit none
          
          type ( input_type ), intent(inout) :: input ! Входные данные
          type ( result_type ), intent(in) :: result ! Результат
          type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine get_eigenvalues
     
     end interface
     
end module qr_alg_m