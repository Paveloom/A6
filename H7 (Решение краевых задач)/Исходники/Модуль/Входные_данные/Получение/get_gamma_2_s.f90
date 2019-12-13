submodule ( input_m ) get_gamma_2_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение параметра gamma_2
     module procedure get_gamma_2
          
          gamma_2_pt => input%gamma_2
          
     end procedure get_gamma_2
     
end submodule get_gamma_2_s