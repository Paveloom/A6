submodule ( settings_m ) get_input_params_err_s
implicit none
     
     contains
     
     ! Функция для получения указателя на величину малости
     ! для входных параметров alpha_1, alpha_2, beta_1 и beta_
     module procedure get_input_params_err
          
          input_params_err_pt => settings%input_params_err
          
     end procedure get_input_params_err
     
end submodule get_input_params_err_s