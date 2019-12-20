submodule ( input_m ) get_r_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на
     ! значение правой границы промежутка
     module procedure get_r_pt
          
          r_pt => input%r
          
     end procedure get_r_pt
     
end submodule get_r_pt_s