submodule ( settings_m ) get_z_l_initial_2_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! второго начального значения при вариации z(l)
     module procedure get_z_l_initial_2
          
          z_l_initial_2 = settings%z_l_initial_2
          
     end procedure get_z_l_initial_2
     
end submodule get_z_l_initial_2_s