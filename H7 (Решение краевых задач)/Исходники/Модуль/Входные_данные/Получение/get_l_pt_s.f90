submodule ( input_m ) get_l_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на
     ! значение левой границы промежутка
     module procedure get_l_pt
          
          l_pt => input%l
          
     end procedure get_l_pt
     
end submodule get_l_pt_s