submodule ( input_m ) get_l_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение левой границы промежутка
     module procedure get_l
          
          l_pt => input%l
          
     end procedure get_l
     
end submodule get_l_s