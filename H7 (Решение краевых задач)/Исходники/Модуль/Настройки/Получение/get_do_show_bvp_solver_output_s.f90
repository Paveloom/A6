submodule ( settings_m ) get_do_show_bvp_solver_output_s
implicit none
     
     contains
     
     ! Функция  для получения указателя на ответ на вопрос:
     ! показывать вывод при определении родов граничных условий?
     module procedure get_do_show_bvp_solver_output
          
          do_show_bvp_solver_output_pt => settings%do_show_bvp_solver_output
          
     end procedure get_do_show_bvp_solver_output
     
end submodule get_do_show_bvp_solver_output_s