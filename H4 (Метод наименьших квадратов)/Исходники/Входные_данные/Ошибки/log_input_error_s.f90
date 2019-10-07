submodule ( input_warns_m ) log_input_error_s ! Подмодуль с процедурой для вывода ошибок для модулей, 
                                              ! связанных с входными данными
implicit none

     contains

     ! Процедура для вывода ошибок для модулей, связанных с входными данными
     module procedure log_input_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в read_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось открыть файл '//file//'&
                                                                      & для чтения.'
               stop

               case ('WR_ls_ftype_temp') ! Встречается в read_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать элемент ls_ftype&
                                                                      & из файла '//file//'. Проверьте правильность&
                                                                      & введенных данных.'
               stop

               case ('WR_N') ! Встречается в read_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать элемент N&
                                                                      & из файла '//file//'. Проверьте правильность&
                                                                      & введенных данных.'
               stop

               case ('WA_matrix') ! Встречается в read_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось выделить память под &
                                                                      &размещаемую матрицу matrix для объекта типа&
                                                                      & input_type.'
               stop

               case ('WR_matrix') ! Встречается в read_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось считать матрицу matrix&
                                                                      & из файла '//file//'. Проверьте правильность&
                                                                      & введенных данных.'
               stop

               case ('WD_ls_ftype') ! Встречается в deallocate_input_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось освободить память из-под&
                                                                      & размещаемой переменной ls_ftype объекта&
                                                                      & типа input_type.'
               stop

               case ('WD_matrix') ! Встречается в deallocate_input_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Не удалось освободить память из-под&
                                                                      & размещаемой матрицы matrix объекта&
                                                                      & типа input_type.'
               stop

               case ('NA_ls_ftype') ! Встречается в deallocate_input_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Память под переменную ls_ftype объекта&
                                                                      & типа input_type не была выделена.'
               stop

               case ('NA_matrix') ! Встречается в deallocate_input_s

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Память под матрицу matrix объекта&
                                                                      & типа input_type не была выделена.'
               stop

               case default

               write(*,'(/, 5x, a, /, 5x, a, /)') 'log_input_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_input_error

end submodule log_input_error_s