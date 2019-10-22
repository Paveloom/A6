submodule ( input_m ) get_N_s ! Подмодуль, содержащий функцию 
                              ! для получения указателя на число строк матрицы
implicit none
     
     contains
     
     ! Функция для получения указателя на число строк матрицы
     module procedure get_N
          
          N => input%N
          
     end procedure get_N
     
end submodule get_N_s