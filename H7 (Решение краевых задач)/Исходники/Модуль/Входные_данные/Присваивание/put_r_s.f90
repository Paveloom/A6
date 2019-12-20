submodule ( input_m ) put_r_s
implicit none
     
     contains
     
     ! Процедура для указания значения правой границы промежутка
     module procedure put_r
          
          input%r = r
          
     end procedure put_r
     
end submodule put_r_s