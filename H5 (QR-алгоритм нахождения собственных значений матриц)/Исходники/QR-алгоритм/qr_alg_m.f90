module qr_alg_m ! Модуль, содержащий процедуры для нахождения значений собственных
                ! чисел квадратных матриц с помощью модифицированного
                ! QR-алгоритма
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use householder_reduction_m, only : get_hessenberg_form ! Процедура для общего вызова процедуры, реализующей
                                                        ! метод Хаусхолдера для приведения исходной матрицы к 
                                                        ! матрице Хессенберга (почти треугольной матрице)
use hqr_m, only : hqr_alg_with_rayleigh_quotient_shift ! Процедура общего вызова процедур, 
                                                       ! реализующих QR-алгоритм Хаусхолдера
                                                       ! со сдвигом по отношению Релея
use fqr_m, only : francis_double_step_qr_alg ! Процедура общего вызова процедур, реализующих 
                                             ! QR-алгоритм Фрэнсиса с двойным сдвигом
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
               type ( result_type ), intent(inout) :: result ! Результат
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine get_eigenvalues

     end interface

end module qr_alg_m