submodule ( input_errors_m ) log_input_error_s ! Процедура для вывода ошибок для других процедур,
                                               ! связанных с входными данными
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с входными данными
     module procedure log_input_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось открыть файл '//file//'&
                                                                           & для чтения.'
                    stop

               case ('WR_l') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение левой границы промежутка в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_r') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение правой границы промежутка в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_n') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение числа разбиений промежутка в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_alpha_1') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение параметра alpha_1 в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_beta_1') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение параметра beta_1 в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_gamma_1') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение параметра gamma_1 в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_alpha_2') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение параметра alpha_2 в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_beta_2') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение параметра beta_2 в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WR_gamma_2') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать значение параметра gamma_2 в&
                                                                           & файле '//file//'. Проверьте правильность&
                                                                           & введенных данных.'
                    stop

               case ('WС') ! Встречается в read_input_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось закрыть файл '//file//'&
                                                                           & для чтения.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_input_error

end submodule log_input_error_s