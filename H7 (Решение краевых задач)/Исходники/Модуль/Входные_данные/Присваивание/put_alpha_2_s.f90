submodule ( input_m ) put_alpha_2_s
implicit none
     
     contains
     
     ! Процедура для указания значения параметра alpha_2
     module procedure put_alpha_2
          
          input%alpha_2 = alpha_2
          
     end procedure put_alpha_2
     
end submodule put_alpha_2_s