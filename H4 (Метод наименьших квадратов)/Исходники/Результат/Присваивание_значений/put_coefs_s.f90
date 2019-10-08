submodule ( result_m ) put_coefs_s ! Подмодуль, содержащий процедуру для
                                   ! присваивания значения массиву coefs
implicit none
     
     contains
     
     ! Процедура для присваивания значения массиву coefs
     module procedure put_coefs
          
          result%coefs = coefs
          
     end procedure put_coefs
     
end submodule put_coefs_s