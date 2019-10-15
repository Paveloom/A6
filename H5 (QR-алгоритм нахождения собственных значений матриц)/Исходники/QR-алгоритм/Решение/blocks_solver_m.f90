module blocks_solver_m ! Модуль, содержащий процедуру, выполняющую
                       ! поиск собственных чисел и решение блоков 
                       ! в квазитреугольной вещественной матрице
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика
                 & FP    ! Число байт для хранения вспомогательной строки
use result_m, only : result_type ! Тип, определяющий результат
implicit none
     
     private
     public :: solve_blocks_and_find_eigenvalues_loud, & ! Процедура, выполняющая поиск собственных чисел
                                                         ! и решение блоков в квазитреугольной вещественной матрице
                                                         ! (с дополнительным выводом)
             & solve_blocks_and_find_eigenvalues_silent  ! Процедура, выполняющая поиск собственных чисел
                                                         ! и решение блоков в квазитреугольной вещественной матрице
                                                         ! (без дополнительного вывода)
     
     interface
     
          ! Процедура, выполняющая поиск собственных чисел
          ! и решение блоков в квазитреугольной вещественной матрице
          ! (с дополнительным выводом)
          module impure subroutine solve_blocks_and_find_eigenvalues_loud(matrix, result)
          implicit none
          
               real(RP), dimension(:, :), contiguous, intent(in) :: matrix ! Вещественная 
                                                                           ! квазитреугольная
                                                                           ! матрица
               type ( result_type ), intent(inout) :: result ! Результат

          end subroutine solve_blocks_and_find_eigenvalues_loud

          ! Процедура, выполняющая поиск собственных чисел
          ! и решение блоков в квазитреугольной вещественной матрице
          ! (без дополнительного вывода)
          module impure subroutine solve_blocks_and_find_eigenvalues_silent(matrix, result)
          implicit none
          
               real(RP), dimension(:, :), contiguous, intent(in) :: matrix ! Вещественная 
                                                                           ! квазитреугольная
                                                                           ! матрица
               type ( result_type ), intent(inout) :: result ! Результат

          end subroutine solve_blocks_and_find_eigenvalues_silent
     
     end interface
     
end module blocks_solver_m