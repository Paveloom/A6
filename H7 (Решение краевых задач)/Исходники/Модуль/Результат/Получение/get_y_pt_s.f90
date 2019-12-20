submodule ( result_m ) get_y_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив значений исходной функции
     module procedure get_y_pt
          
          y_pt => result%y
          
     end procedure get_y_pt
     
end submodule get_y_pt_s