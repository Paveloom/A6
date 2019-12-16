submodule ( result_m ) get_x_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив узловых точек
     module procedure get_x_pt
          
          x_pt => result%x
          
     end procedure get_x_pt
     
end submodule get_x_pt_s