submodule ( input_m ) put_beta_2_s
implicit none
     
     contains
     
     ! Процедура для указания значения параметра beta_2
     module procedure put_beta_2
          
          input%beta_2 = beta_2
          
     end procedure put_beta_2
     
end submodule put_beta_2_s