submodule ( result_m ) put_ls_ftype_s ! Подмодуль, содержащий процедуру для
                                      ! присваивания значения переменной ls_ftype
implicit none
     
     contains
     
     ! Процедура для присваивания значения переменной ls_ftype
     module procedure put_ls_ftype
          
          result%ls_ftype = ls_ftype
          
     end procedure put_ls_ftype
     
end submodule put_ls_ftype_s