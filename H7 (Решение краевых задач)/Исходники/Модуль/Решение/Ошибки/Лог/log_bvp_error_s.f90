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

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_bvp_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_bvp_error

end submodule log_bvp_error_s