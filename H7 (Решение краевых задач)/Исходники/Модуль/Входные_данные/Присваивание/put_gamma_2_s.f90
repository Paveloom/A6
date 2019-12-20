submodule ( input_m ) put_gamma_2_s
implicit none
     
     contains
     
     ! Процедура для указания значения параметра gamma_2
     module procedure put_gamma_2
          
          input%gamma_2 = gamma_2
          
     end procedure put_gamma_2
     
end submodule put_gamma_2_s