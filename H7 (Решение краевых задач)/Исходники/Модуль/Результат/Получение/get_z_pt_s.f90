submodule ( result_m ) get_z_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив 
     ! значений производной исходной функции
     module procedure get_z_pt
          
          z_pt => result%z
          
     end procedure get_z_pt
     
end submodule get_z_pt_s