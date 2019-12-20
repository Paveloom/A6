submodule ( input_m ) get_l_s
implicit none
     
     contains
     
     ! Функция для получения
     ! значения левой границы промежутка
     module procedure get_l
          
          l = input%l
          
     end procedure get_l
     
end submodule get_l_s