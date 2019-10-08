submodule ( result_m ) put_err_s ! Подмодуль, содержащий процедуру для
                                 ! присваивания значения переменной err
implicit none
     
     contains
     
     ! Процедура для присваивания значения переменной err
     module procedure put_err
          
          result%err = err
          
     end procedure put_err
     
end submodule put_err_s