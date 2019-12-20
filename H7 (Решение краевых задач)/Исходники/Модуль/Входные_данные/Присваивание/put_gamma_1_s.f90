submodule ( input_m ) put_gamma_1_s
implicit none
     
     contains
     
     ! Процедура для указания значения параметра gamma_1
     module procedure put_gamma_1
          
          input%gamma_1 = gamma_1
          
     end procedure put_gamma_1
     
end submodule put_gamma_1_s