submodule ( input_m ) deallocate_input_s ! Подмодуль с процедурой для освобождения памяти из-под входных данных
implicit none

     contains

     ! Процедура для освобождения памяти из-под входных данных
     module procedure deallocate_input
          
          integer(SP) :: stat ! Статусная переменная

          if ( allocated(input%ls_ftype) ) then ! Проверка, размещена ли переменная ls_ftype объекта

               deallocate( input%ls_ftype, stat = stat ) ! Освобождение памяти из-под типа функции
               if ( stat .ne. 0_SP ) call log_input_error('WD_ls_ftype') ! Проверка на ошибку освобождения памяти
          
          else

               call log_input_error('NA_ls_ftype') ! Вывод ошибки о неразмещенной переменной

          endif

          if ( allocated(input%matrix) ) then ! Проверка, размещена ли матрица объекта

               deallocate( input%matrix, stat = stat ) ! Освобождение памяти из-под матрицы входных данных
               if ( stat .ne. 0_SP ) call log_input_error('WD_matrix') ! Проверка на ошибку освобождения памяти

          else

               call log_input_error('NA_matrix') ! Вывод ошибки о неразмещенной матрице

          endif

          if ( allocated(input%file) ) then ! Проверка, размещена ли переменная file объекта

               deallocate( input%file, stat = stat ) ! Освобождение памяти из-под имени файла
               if ( stat .ne. 0_SP ) call log_input_error('WD_file') ! Проверка на ошибку освобождения памяти

          else

               call log_input_error('NA_file') ! Вывод ошибки о неразмещенной переменной file

          endif

     end procedure deallocate_input

end submodule deallocate_input_s