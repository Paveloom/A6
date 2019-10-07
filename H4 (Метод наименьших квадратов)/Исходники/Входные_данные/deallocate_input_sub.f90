submodule ( input_m ) deallocate_input_sub ! Подмодуль с процедурой для считывания начальных данных
implicit none

     contains

     ! Процедура для освобождения памяти из-под входных данных
     module procedure deallocate_input
          
          deallocate( input%ls_ftype ) ! Освобождение памяти из-под типа функции
          deallocate( input%matrix ) ! Освобождение памяти из-под матрицы входных данных

     end procedure deallocate_input

end submodule deallocate_input_sub