module main_solver_m ! Модуль, описывающий процедуру для представления
                     ! структуры вызовов вариационных процедур 
                     ! и получения результата
implicit none
     
     private
     public :: solve_bvp ! Процедура общего вызова

     interface
     
          module subroutine solve_bvp()
          implicit none
          
               
          
          end subroutine solve_bvp
     
     end interface
     
end module main_solver_m