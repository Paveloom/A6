submodule ( bvp_errors_m ) log_bvp_error_s
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, 
     ! связанных с получением решения для краевой задачи
     module procedure log_bvp_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WBL') ! Встречается в solve_bvp_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Оба параметра alpha_1 и beta_1 близки к нулю.&
                                                                        & Краевое условие на левой границе задано неверно.'
                    stop

               case ('WBR') ! Встречается в solve_bvp_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Оба параметра alpha_2 и beta_2 близки к нулю.&
                                                                        & Краевое условие на правой границе задано неверно.'
                    stop

               case ('WA_alpha') ! Встречается в solve_bvp_tma_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Не удалось выделить память под массив alpha.'
                    stop

               case ('WA_beta') ! Встречается в solve_bvp_tma_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Не удалось выделить память под массив beta.'
                    stop

               case ('WD_alpha') ! Встречается в solve_bvp_tma_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Не удалось освободить память из-под массива alpha.'
                    stop

               case ('WD_beta') ! Встречается в solve_bvp_tma_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Не удалось выделить память из-под массива beta.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_bvp_error

end submodule log_bvp_error_s