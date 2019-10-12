module qr_alg_m ! Модуль, содержащий процедуры для нахождения значений собственных
                ! чисел квадратных матриц с помощью модифицированного
                ! QR-алгоритма
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use householder_reduction_m, only : get_hessenberg_form ! Процедура для общего вызова процедуры, реализующей
                                                        ! метод Хаусхолдера для приведения исходной матрицы к 
                                                        ! матрице Хессенберга (почти треугольной матрице)
implicit none
     
     private
     public :: get_eigenvalues ! Процедура главного вызова модифицированного QR-алгоритма
                               ! для нахождения значений собственных чисел квадратных матриц
     
     interface
     
          ! Процедура главного вызова модифицированного QR-алгоритма
          ! для нахождения значений собственных чисел квадратных матриц
          module impure elemental subroutine get_eigenvalues(input, result)
          implicit none
          
          type ( input_type ), intent(inout) :: input ! Входные данные
          type ( result_type ), intent(in) :: result ! Результат
          
          end subroutine get_eigenvalues
     
     end interface
     
end module qr_alg_m