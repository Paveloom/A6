submodule ( input_m ) get_beta_1_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! параметра beta_1
     module procedure get_beta_1
          
          beta_1 = input%beta_1
          
     end procedure get_beta_1
     
end submodule get_beta_1_s