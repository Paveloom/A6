submodule ( input_m ) get_n_pt_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! правой границы промежутка
     module procedure get_n_pt
          
          n_pt => input%n
          
     end procedure get_n_pt
     
end submodule get_n_pt_s