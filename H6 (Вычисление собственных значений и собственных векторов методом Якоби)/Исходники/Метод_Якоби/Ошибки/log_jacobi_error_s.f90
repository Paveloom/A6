submodule ( jacobi_warns_m ) log_jacobi_error_s ! Подмодуль с процедурой для вывода ошибок для 
                                                    ! других процедур, связанных с методом Якоби
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с методом Якоби
     module procedure log_jacobi_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WA_U') ! Встречается в allocate_rotation_matrices_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось выделить память под глобальную матрицу&
                                                                             & вращения.'
                    stop

               case ('WA_U_k') ! Встречается в allocate_rotation_matrices_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось выделить память под итерационную матрицу&
                                                                             & вращения.'
                    stop

               case ('WA_NA') ! Встречается в allocate_rotation_matrices_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось выделить память под новую матрицу&
                                                                             & объекта.'
                    stop

               case ('WA_evalues') ! Встречается в send_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось выделить память под размещаемый массив&
                                                                             & evalues при отправке результата.'
                    stop

               case ('WD_U') ! Встречается в deallocate_rotation_matrices_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось освободить память из-под глобальной матрицы&
                                                                             & вращения.'
                    stop
                    
               case ('WD_U_k') ! Встречается в deallocate_rotation_matrices_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось освободить память из-под итерационной матрицы&
                                                                             & вращения.'
                    stop

               case ('WD_NA') ! Встречается в deallocate_rotation_matrices_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось освободить память из-под новой матрицы&
                                                                             & объекта.'
                    stop

               case ('WD_evalues') ! Встречается в send_result_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Не удалось освободить память из-под размещаемого массива&
                                                                             & evalues при отправке результата.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_jacobi_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_jacobi_error

end submodule log_jacobi_error_s