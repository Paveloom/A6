submodule ( input_m ) put_beta_1_s
implicit none
     
     contains
     
     ! Процедура для указания значения параметра beta_1
     module procedure put_beta_1
          
          input%beta_1 = beta_1
          
     end procedure put_beta_1
     
end submodule put_beta_1_s