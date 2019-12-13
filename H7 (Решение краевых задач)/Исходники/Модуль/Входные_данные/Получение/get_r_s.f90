submodule ( input_m ) get_r_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение правой границы промежутка
     module procedure get_r
          
          r_pt => input%r
          
     end procedure get_r
     
end submodule get_r_s