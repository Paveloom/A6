submodule ( lsm_warns_m ) log_lsm_error_s ! Подмодуль, содержащий процедуру для вывода 
                                          ! ошибок для модулей, связанных с вызовами
                                          ! метода наименьших квадратов
implicit none
     
     contains
     
     ! Процедура для вывода ошибок для модулей, связанных с вызовами метода наименьших квадратов
     module procedure log_lsm_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WT') ! Встречается в lsm

                    write(*,'( /, 2(5x, a, /), /, 5x, a, //, 5(5x, a, /), /, 2(5x, a, /) )') 'lsm: ', &
                    &'Был введен неверный тип функции для использования МНК в файле '//file//'.', &
                    &'Возможны следующие варианты:', &
                    &'linear: линейная функция;', &
                    &'hyperbolic: гиперболическая функция;', &
                    &'logarithmic: логарифмическая функция;', &
                    &'exponential: экспоненциальная функция;', &
                    &'quadratic: квадратичная функция.', &
                    &'Также возможно указать программе пропускать все', &
                    &'варианты с помощью ключевого слова all.'
          
               case ('WD_ls_ftype') ! Встречается в lsm

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось освободить память из-под&
                                                                         & временной размещаемой переменной ls_ftype.'

                    stop

               case ('WD_file') ! Встречается в lsm

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось освободить память из-под&
                                                                         & временной размещаемой переменной file.'

                    stop

               case ('WA_r_row') ! Встречается в lsm_hyperbolic

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось выделить память для временной&
                                                                         & размещаемой переменной r_row.'

                    stop

               case ('WD_r_row') ! Встречается в lsm_hyperbolic

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось освободить память из-под временной&
                                                                         & размещаемой переменной r_row.'

                    stop

               case ('WA_ln_row') ! Встречается в lsm_logarithmic

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось выделить память для временной&
                                                                         & размещаемой переменной ln_row.'

                    stop

               case ('WD_ln_row') ! Встречается в lsm_logarithmic

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось освободить память из-под временной&
                                                                         & размещаемой переменной ln_row.'

                    stop

               case ('WA_ln_row2') ! Встречается в lsm_exponential

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось выделить память для временной&
                                                                         & размещаемой переменной ln_row2.'

                    stop

               case ('WD_ln_row2') ! Встречается в lsm_exponential

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось освободить память из-под временной&
                                                                         & размещаемой переменной ln_row2.'

                    stop

               case ('WA_sq_row') ! Встречается в lsm_qudratic

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось выделить память для временной&
                                                                         & размещаемой переменной sq_row.'

                    stop

               case ('WD_sq_row') ! Встречается в lsm_qudratic

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error: ', 'Не удалось освободить память из-под временной&
                                                                         & размещаемой переменной sq_row.'

                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_lsm_error:', 'Неизвестный код ошибки.'

          end select
          
     end procedure log_lsm_error
     
end submodule log_lsm_error_s