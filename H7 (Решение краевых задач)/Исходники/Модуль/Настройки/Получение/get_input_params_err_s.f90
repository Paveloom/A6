submodule ( settings_m ) get_input_params_err_s
implicit none
     
     contains
     
     ! Функция для получения указателя на величину малости
     ! для входных параметров alpha_1, beta_1, alpha_2 и beta_2
     module procedure get_input_params_err
          
          input_params_err_pt => settings%input_params_err
          
     end procedure get_input_params_err
     
end submodule get_input_params_err_s