submodule ( input_m ) get_matrix_s ! Подмодуль, содержащий функцию для 
                                   ! получения указателя на матрицу объекта
implicit none
     
     contains
     
     ! Функция для получения указателя на матрицу объекта
     module procedure get_matrix
          
          matrix => input%matrix
          
     end procedure get_matrix
     
end submodule get_matrix_s