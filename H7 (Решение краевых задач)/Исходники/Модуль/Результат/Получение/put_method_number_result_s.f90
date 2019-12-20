submodule ( result_m ) put_method_number_result_s
implicit none
     
     contains
     
     ! Процедура для указания значения 
     ! номера метода для решения краевой задачи
     module procedure put_method_number_result
          
          result%method_number = method_number
          
     end procedure put_method_number_result
     
end submodule put_method_number_result_s