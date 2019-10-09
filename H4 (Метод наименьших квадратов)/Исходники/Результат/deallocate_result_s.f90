submodule ( result_m ) deallocate_result_s ! Подмодуль с процедурой для освобождения памяти из-под результата
implicit none

     contains

     ! Процедура для освобождения памяти из-под результата
     module procedure deallocate_result
          
          integer(SP) :: stat ! Статусная переменная

          if ( allocated(result%ls_ftype) ) then ! Проверка, размещена ли переменная ls_ftype объекта

               deallocate( result%ls_ftype, stat = stat ) ! Освобождение памяти из-под типа функции
               if ( stat .ne. 0_SP ) call log_result_error('WD_ls_ftype') ! Проверка на ошибку освобождения памяти

          else

               call log_result_error('NA_ls_ftype') ! Вывод ошибки о неразмещенной переменной

          endif

          if ( allocated(result%coefs) ) then ! Проверка, размещен ли массив coefs объекта

               deallocate( result%coefs, stat = stat ) ! Освобождение памяти из-под массива коэффициентов
               if ( stat .ne. 0_SP ) call log_result_error('WD_coefs') ! Проверка на ошибку освобождения памяти

          else

               call log_result_error('NA_coefs') ! Вывод ошибки о неразмещенном массиве
          
          endif

          if ( allocated(result%file) ) then ! Проверка, размещена ли переменная file объекта

               deallocate( result%file, stat = stat ) ! Освобождение памяти из-под имени файла
               if ( stat .ne. 0_SP ) call log_result_error('WD_file') ! Проверка на ошибку освобождения памяти

          else

               call log_result_error('NA_file') ! Вывод ошибки о неразмещенной переменной
          
          endif
               
     end procedure deallocate_result

end submodule deallocate_result_s