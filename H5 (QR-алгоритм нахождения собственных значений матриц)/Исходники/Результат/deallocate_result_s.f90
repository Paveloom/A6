submodule ( result_m ) deallocate_result_s ! Подмодуль, содержащий процедуру для 
                                           ! освобождения памяти из-под результата
implicit none
     
     contains
     
     ! Процедура для освобождения памяти из-под результата
     module procedure deallocate_result
          
          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива собственных чисел матрицы
          if ( allocated(result%evalues) ) then
          
               deallocate( result%evalues, stat = stat )
               if ( stat .ne. 0_SP ) call log_result_error('WD_evalues')
               
          else

               ! Вывод ошибки о неразмещенном массиве
               call log_result_error('NA_evalues')

          endif

     end procedure deallocate_result
     
end submodule deallocate_result_s