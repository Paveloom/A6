submodule ( bvp_solver_m ) solve_bvp_s
implicit none
     
     contains
     
     ! Процедура общего вызова для получения решения
     module procedure solve_bvp
          
          ! Показывать вывод при определении родов граничных условий?
          if ( settings%get_do_show_bvp_solver_output() ) then

               ! Вызов процедуры с дополнительным выводом
               call solve_bvp_loud(input, settings, result)

          else

               ! Вызов процедуры без дополнительного вывода
               call solve_bvp_quiet(input, settings, result)

          endif
          
     end procedure solve_bvp
     
end submodule solve_bvp_s