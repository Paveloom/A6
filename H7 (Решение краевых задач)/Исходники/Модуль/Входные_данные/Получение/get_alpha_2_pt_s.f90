submodule ( input_m ) get_alpha_2_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение параметра alpha_2
     module procedure get_alpha_2_pt
          
          alpha_2_pt => input%alpha_2
          
     end procedure get_alpha_2_pt
     
end submodule get_alpha_2_pt_s