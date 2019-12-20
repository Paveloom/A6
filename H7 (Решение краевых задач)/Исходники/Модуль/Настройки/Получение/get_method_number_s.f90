submodule ( settings_m ) get_method_number_s
implicit none
     
     contains
     
     ! Функция для получения номера
     ! метода для решения краевой задачи
     module procedure get_method_number
          
          method_number = settings%method_number
          
     end procedure get_method_number
     
end submodule get_method_number_s