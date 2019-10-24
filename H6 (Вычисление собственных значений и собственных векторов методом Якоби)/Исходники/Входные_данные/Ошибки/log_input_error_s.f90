submodule ( input_warns_m ) log_input_error_s ! Процедура для вывода ошибок для других процедур,
                                              ! связанных с входными данными
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с входными данными
     module procedure log_input_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось открыть файл '//file//'&
                                                                           & для чтения.'
                    stop

               case ('WR_N') ! Встречается в read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать число строк матрицы в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WA_matrix') ! Встречается в read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось выделить память под матрицу&
                                                                           & для объекта типа input_type.'
                    stop

               case ('WR_matrix') ! Встречается в read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать матрицу в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WС') ! Встречается в read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось закрыть файл '//file//'&
                                                                           & для чтения.'
                    stop

               case ('WD_matrix') ! Встречается в deallocate_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось освободить память из-под&
                                                                           & размещаемой матрицы объекта типа input_type.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_input_error

end submodule log_input_error_s