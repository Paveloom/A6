submodule ( input_m ) get_alpha_1_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение параметра alpha_1
     module procedure get_alpha_1_pt
          
          alpha_1_pt => input%alpha_1
          
     end procedure get_alpha_1_pt
     
end submodule get_alpha_1_pt_s