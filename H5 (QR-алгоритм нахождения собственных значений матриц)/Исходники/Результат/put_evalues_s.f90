submodule ( result_m ) put_evalues_s ! Подмодуль, содержащий процедуру для
                                     ! присваивания значений массиву
                                     ! собственных чисел результата
implicit none
     
     contains
     
     ! Процедура для присваивания значений массиву
     ! собственных чисел результата
     module procedure put_evalues
          
          result%evalues = evalues
          
     end procedure put_evalues
     
end submodule put_evalues_s