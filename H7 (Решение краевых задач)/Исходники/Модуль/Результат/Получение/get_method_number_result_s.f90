submodule ( result_m ) get_method_number_result_s
implicit none
     
     contains
     
     ! Функция для получения указателя на 
     ! номер метода для решения краевой задачи
     module procedure get_method_number_result
          
          method_number_pt => result%method_number
          
     end procedure get_method_number_result
     
end submodule get_method_number_result_s