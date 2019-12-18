submodule ( input_m ) get_beta_1_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение параметра beta_1
     module procedure get_beta_1_pt
          
          beta_1_pt => input%beta_1
          
     end procedure get_beta_1_pt
     
end submodule get_beta_1_pt_s