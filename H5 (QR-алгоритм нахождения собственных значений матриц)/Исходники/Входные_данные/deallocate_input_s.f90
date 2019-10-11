submodule ( input_m ) deallocate_input_s ! Подмодуль, содержащий процедуру для
                                         ! освобождения памяти из-под входных данных
implicit none
     
     contains
     
     ! Процедура для освобождения памяти из-под входных данных
     module procedure deallocate_input

          integer(SP) :: stat ! Статусная переменная
          
          ! Освобождение памяти из-под матрицы объекта
          if ( allocated(input%matrix) ) then

               deallocate( input%matrix, stat = stat )
               if ( stat .ne. 0_SP ) call log_input_error('WD_matrix') ! Проверка на ошибку освобождения памяти

          else 

               call log_input_error('NA_matrix') ! Вывод ошибки о неразмещенной матрице

          endif
          
     end procedure deallocate_input
     
end submodule deallocate_input_s