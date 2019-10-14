module fqr_m  ! Модуль, содержащий процедуры,
              ! реализующие QR-алгоритм Фрэнсиса
              ! с двойным сдвигом
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & JP, & ! Точность целого числа счетчика
                 & FP, & ! Число байт для хранения вспомогательной строки
                 & LP    ! Число байт для хранения логической переменной
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use householder_reduction_m, only : determine_the_reflector ! Функция, возвращающая вектор Хаусхолдера для столбца
                                                            ! [x, y, z]^T в алгоритме Фрэнсиса с двойным сдвигом
use givens_rotations_m, only : get_givens_rotation_matrix ! Функция для получения вещественной матрицы вращения, 
                                                          ! необходимой для QR-алгоритма Фрэнсиса
use blocks_solver_m, only : solve_blocks_and_find_eigenvalues_loud, & ! Процедура, выполняющая поиск собственных чисел
                                                                      ! и решение блоков в квазитреугольной вещественной матрице
                                                                      ! (с дополнительным выводом)
                          & solve_blocks_and_find_eigenvalues_silent  ! Процедура, выполняющая поиск собственных чисел
                                                                      ! и решение блоков в квазитреугольной вещественной матрице
                                                                      ! (без дополнительного вывода)
implicit none
     
     private
     public :: francis_double_step_qr_alg ! Процедура общего вызова процедур, реализующих 
                                          ! QR-алгоритм Фрэнсиса с двойным сдвигом
     
     interface

          ! Процедура общего вызова процедур, реализующих 
          ! QR-алгоритм Фрэнсиса с двойным сдвигом
          module impure subroutine francis_double_step_qr_alg(input, result, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine francis_double_step_qr_alg

          ! Процедура, реализующая QR-алгоритм Фрэнсиса с двойным сдвигом
          ! (с дополнительным выводом)
          module impure subroutine francis_double_step_qr_alg_loud(input, result, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine francis_double_step_qr_alg_loud

          ! Процедура, реализующая QR-алгоритм Фрэнсиса с двойным сдвигом
          ! (без дополнительного вывода)
          module impure subroutine francis_double_step_qr_alg_silent(input, result, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine francis_double_step_qr_alg_silent

     end interface
     
end module fqr_m