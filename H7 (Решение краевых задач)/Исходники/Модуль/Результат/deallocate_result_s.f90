submodule ( result_m ) deallocate_result_s
implicit none
     
     contains
     
     ! Процедура для освобождения памяти из-под результата
     module procedure deallocate_result
          
          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива узловых точек
          if ( allocated(result%x) ) then
          
               deallocate( result%x, stat = stat )
               if ( stat .ne. 0_SP ) call log_result_error('WD_x')
               
          endif

          ! Освобождение памяти из-под массива значений искомой функции
          if ( allocated(result%y) ) then
          
               deallocate( result%y, stat = stat )
               if ( stat .ne. 0_SP ) call log_result_error('WD_y')
               
          endif

          ! Освобождение памяти из-под массива значений производной искомой функции
          if ( allocated(result%z) ) then
          
               deallocate( result%z, stat = stat )
               if ( stat .ne. 0_SP ) call log_result_error('WD_z')
               
          endif

     end procedure deallocate_result
     
end submodule deallocate_result_s