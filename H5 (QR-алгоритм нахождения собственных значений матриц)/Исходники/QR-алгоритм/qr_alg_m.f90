module qr_alg_m ! Модуль, содержащий процедуры для нахождения значений собственных
                ! чисел квадратных матриц с помощью модифицированного
                ! QR-алгоритма
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & JP    ! Точность целого числа счетчика
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use householder_reduction_m, only : get_hessenberg_form, & ! Процедура для общего вызова процедуры, реализующей
                                                           ! метод Хаусхолдера для приведения исходной матрицы к 
                                                           ! матрице Хессенберга (почти треугольной матрице)
                                  & determine_the_reflector ! Функция, возвращающая вектор Хаусхолдера для столбца
                                                            ! [x, y, z]^T в алгоритме Фрэнсиса с двойным сдвигом
use givens_rotations_m, only : get_givens_rotation_coefs, get_givens_rotation_matrix, sgn
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

          ! Процедура, выполняющая шаг QR-разложения
          ! и RQ-композиции для матрицы Хессенберга
          ! с дополнительным выводом
          module subroutine make_a_hessenberg_qr_step_loud(input, m) 
          implicit none
                    
               type ( input_type ) input ! Входные данные
               integer(JP) m ! Активный размер матрицы
                         
          end subroutine make_a_hessenberg_qr_step_loud

          ! Процедура, реализующая QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
          module impure subroutine hqr_alg_with_rayleigh_quotient_shift(input, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine hqr_alg_with_rayleigh_quotient_shift

          ! Процедура, реализующая QR-алгоритм Фрэнсиса с двойным сдвигом
          module impure subroutine francis_double_step_qr_alg(input, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine francis_double_step_qr_alg
     
     end interface
     
end module qr_alg_m