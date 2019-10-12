submodule ( settings_warns_m ) log_settings_error_s ! Подмодуль с процедурой для вывода ошибок для 
                                                    ! других процедур, связанных с настройками
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с настройками
     module procedure log_settings_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось открыть файл '//file//'&
                                                                             & для чтения.'
                    stop

               case ('WR_Q1') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на первый&
                                                                             & вопрос из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WC') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось закрыть файл '//file//'&
                                                                             & для чтения.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_settings_error

end submodule log_settings_error_s