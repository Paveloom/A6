submodule ( settings_m ) get_y_l_initial_1_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! первого начального значения при вариации y(l)
     module procedure get_y_l_initial_1
          
          y_l_initial_1 = settings%y_l_initial_1
          
     end procedure get_y_l_initial_1
     
end submodule get_y_l_initial_1_s