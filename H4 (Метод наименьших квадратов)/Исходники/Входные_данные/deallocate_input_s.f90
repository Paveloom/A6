submodule ( input_m ) deallocate_input_s ! Подмодуль с процедурой для освобождения памяти из-под входных данных
implicit none

     contains

     ! Процедура для освобождения памяти из-под входных данных
     module procedure deallocate_input
          
          integer(SP) :: stat ! Статусная переменная

          deallocate( input%ls_ftype, stat = stat ) ! Освобождение памяти из-под типа функции
          if ( stat .ne. 0_SP ) call log_input_error('WD_ls_ftype') ! Проверка на ошибку освобождения памяти

          deallocate( input%matrix, stat = stat ) ! Освобождение памяти из-под матрицы входных данных
          if ( stat .ne. 0_SP ) call log_input_error('WD_matrix') ! Проверка на ошибку освобождения памяти

     end procedure deallocate_input

end submodule deallocate_input_s