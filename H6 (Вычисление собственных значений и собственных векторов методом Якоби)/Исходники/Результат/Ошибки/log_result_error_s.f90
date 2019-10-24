submodule ( result_warns_m ) log_result_error_s ! Подмодуль с процедурой для вывода ошибок для 
                                                ! других процедур, связанных с результатом
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с результатом
     module procedure log_result_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WD_evalues') ! Встречается в deallocate_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Не удалось освободить память из-под&
                                                                           & размещаемого массива evalues объекта&
                                                                           & типа result_type.'
                    stop

               case ('WD_evectors') ! Встречается в deallocate_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Не удалось освободить память из-под&
                                                                           & размещаемой матрицы evectors объекта&
                                                                           & типа result_type.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_result_error

end submodule log_result_error_s