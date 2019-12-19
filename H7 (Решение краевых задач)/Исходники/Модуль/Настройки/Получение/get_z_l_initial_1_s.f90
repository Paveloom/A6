submodule ( settings_m ) get_z_l_initial_1_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! первого начального значения при вариации z(l)
     module procedure get_z_l_initial_1
          
          z_l_initial_1 = settings%z_l_initial_1
          
     end procedure get_z_l_initial_1
     
end submodule get_z_l_initial_1_s