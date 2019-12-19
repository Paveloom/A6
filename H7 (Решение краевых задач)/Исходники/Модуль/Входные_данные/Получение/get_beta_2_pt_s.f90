submodule ( input_m ) get_beta_2_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение параметра beta_2
     module procedure get_beta_2_pt
          
          beta_2_pt => input%beta_2
          
     end procedure get_beta_2_pt
     
end submodule get_beta_2_pt_s