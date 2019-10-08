submodule ( result_warns_m ) log_result_error_s ! Подмодуль с процедурой для вывода ошибок для модулей, 
                                                ! связанных с результатом
implicit none

     contains

     ! Процедура для вывода ошибок для модулей, связанных с результатом
     module procedure log_result_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WD_ls_ftype') ! Встречается в deallocate_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Не удалось освободить память из-под&
                                                                           & размещаемой переменной ls_ftype объекта&
                                                                           & типа result_type.'
                    stop

               case ('WD_coefs') ! Встречается в deallocate_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Не удалось освободить память из-под&
                                                                           & размещаемого массива coefs объекта&
                                                                           & типа result_type.'
                    stop

               case ('NA_ls_ftype') ! Встречается в deallocate_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Память под переменную ls_ftype объекта&
                                                                           & типа result_type не была выделена.'
                    stop

               case ('NA_coefs') ! Встречается в deallocate_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Память под матрицу coefs объекта&
                                                                           & типа result_type не была выделена.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_result_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_result_error

end submodule log_result_error_s