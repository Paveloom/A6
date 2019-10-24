submodule ( result_m ) put_evectors_s ! Подмодуль, содержащий процедуру для
                                      ! присваивания значений матрице
                                      ! собственных векторов результата
implicit none
     
     contains
     
     ! Процедура для присваивания значений матрице
     ! собственных векторов результата
     module procedure put_evectors
          
          result%evectors = evectors
          
     end procedure put_evectors
     
end submodule put_evectors_s