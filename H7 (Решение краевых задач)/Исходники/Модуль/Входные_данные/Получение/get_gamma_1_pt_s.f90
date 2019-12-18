submodule ( input_m ) get_gamma_1_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение параметра gamma_1
     module procedure get_gamma_1_pt
          
          gamma_1_pt => input%gamma_1
          
     end procedure get_gamma_1_pt
     
end submodule get_gamma_1_pt_s