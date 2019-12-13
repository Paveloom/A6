submodule ( input_m ) put_l_s
implicit none
     
     contains
     
     ! Процедура для указания значения левой границы промежутка
     module procedure put_l
          
          input%l = l
          
     end procedure put_l
     
end submodule put_l_s