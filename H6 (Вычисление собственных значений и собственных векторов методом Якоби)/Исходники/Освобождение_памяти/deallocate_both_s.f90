submodule ( deallocate_m ) deallocate_both_s ! Подмодуль с процедурой для освобождения памяти из-под входных данных и результатов
implicit none

     contains

     ! Процедура для освобождения памяти из-под входных данных и результатов
     module procedure deallocate_both
          
          call deallocate_input(input) ! Вызов процедуры для освобождения памяти из-под входных данных
          call deallocate_result(result) ! Вызов процедуры для освобождения памяти из-под результата

     end procedure deallocate_both

end submodule deallocate_both_s