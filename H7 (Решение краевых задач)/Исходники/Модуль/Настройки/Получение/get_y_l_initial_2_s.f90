submodule ( settings_m ) get_y_l_initial_2_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! второго начального значения при вариации y(l)
     module procedure get_y_l_initial_2
          
          y_l_initial_2 = settings%y_l_initial_2
          
     end procedure get_y_l_initial_2
     
end submodule get_y_l_initial_2_s