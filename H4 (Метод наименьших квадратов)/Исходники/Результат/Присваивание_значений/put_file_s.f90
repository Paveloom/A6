submodule ( result_m ) put_file_s ! Подмодуль, содержащий процедуру для
                                  ! присваивания значения переменной file
implicit none
     
     contains
     
     ! Процедура для присваивания значения переменной file
     module procedure put_file
          
          result%file = file
          
     end procedure put_file
     
end submodule put_file_s