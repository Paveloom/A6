submodule ( input_m ) put_alpha_1_s
implicit none
     
     contains
     
     ! Процедура для указания значения параметра alpha_1
     module procedure put_alpha_1
          
          input%alpha_1 = alpha_1
          
     end procedure put_alpha_1
     
end submodule put_alpha_1_s