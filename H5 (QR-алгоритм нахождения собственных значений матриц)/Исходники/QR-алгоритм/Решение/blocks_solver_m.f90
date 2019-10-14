module blocks_solver_m ! Модуль, содержащий процедуру, выполняющую
                       ! поиск собственных чисел и решение блоков 
                       ! в квазитреугольной вещественной матрице
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP    ! Точность целого числа счетчика
use result_m, only : result_type ! Тип, определяющий результат
implicit none
     
     private
     public :: solve_blocks_and_find_eigenvalues ! Процедура, выполняющая поиск собственных чисел
                                     ! и решение блоков в квазитреугольной вещественной матрице
     
     interface
     
          ! Процедура, выполняющая поиск собственных чисел
          ! и решение блоков в квазитреугольной вещественной матрице
          module subroutine solve_blocks_and_find_eigenvalues(matrix, result)
          implicit none
          
               real(RP), dimension(:, :), contiguous, intent(in) :: matrix ! Вещественная 
                                                                           ! квазитреугольная
                                                                           ! матрица
               type ( result_type ), intent(inout) :: result ! Результат

          end subroutine solve_blocks_and_find_eigenvalues
     
     end interface
     
end module blocks_solver_m