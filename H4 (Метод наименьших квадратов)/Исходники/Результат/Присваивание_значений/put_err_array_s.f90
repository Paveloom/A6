submodule ( result_m ) put_err_array_s ! Подмодуль, содержащий процедуру для 
                                       ! присваивания значений массиву err
implicit none
     
     contains
     
     ! Процедура для присваивания значений массиву err
     module procedure put_err_array
          
          result%err_array = err_array
          
     end procedure put_err_array
     
end submodule put_err_array_s