submodule ( hqr_m ) hqr_alg_with_rayleigh_quotient_shift_loud_s ! Подмодуль, содержащий процедуру, реализующую
                                                                ! QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
                                                                ! (с дополнительным выводом)
implicit none
     
     contains
     
     ! Процедура, реализующая QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
     module procedure hqr_alg_with_rayleigh_quotient_shift_loud
          
          integer(JP) :: m, i  ! Вспомогательные переменные
          complex(CP) :: sigma ! Сдвиг по отношению Релея

          real(RP) :: hqr_err ! Ограничение сверху на значение |matrix(m - 1, m)|
                              ! (условие сходимости)

          character(FP) :: f1 ! Вспомогательная строка для автоформатирования

          write(*,'(/, 5x, a, /)') 'QR-алгоритм Хаусхолдера'

          ! Получение условия сходимости
          hqr_err = settings%get_hqr_err()

          associate( matrix => input%matrix, & ! Матрица объекта
                   &      N => input%N       ) ! Число строк матрицы

               ! Запись числа N в строку
               write(f1, '(i2)') IP
               write(f1,'(i'//f1//')') N

               ! Вывод матрицы на входе
               write(*,'(5x, a, /)') 'Матрица Хессенберга:' 
               write(*,'('//f1//'(4x, '//RF//', 4x, '//RF//'))') matrix
               write(*,'()')

               ! Общий цикл
               do m = N, 2, -1

                    ! Цикл, улучшающий значение собственного числа matrix(m, m)
                    repeat : do 

                         ! Присвоение значения сдвигу по отношению Релея
                         sigma = matrix(m, m)

                         ! Вычисление matrix = matrix - I * sigma
                         do i = 1, m

                              matrix(i, i) = matrix(i, i) - sigma

                         enddo

                         ! QR-разложение и RQ-композиция по методу Хаусхолдера
                         ! активной части исходной матрицы
                         call make_a_hessenberg_qr_step(input, m)

                         ! Вычисление matrix = matrix + I * sigma
                         do i = 1, m

                              matrix(i, i) = matrix(i, i) + sigma

                         enddo

                    ! Проверка на значительную малость значения |matrix(m - 1, m)|
                    if ( abs(matrix(m - 1, m)) .lt. hqr_err ) then 
                         
                         matrix(m - 1, m) = cmplx(0._RP, 0._RP, kind = CP)
                         exit repeat
                    
                    endif

                    enddo repeat

               enddo

               ! Вывод результата
               write(*,'(5x, a, /)') 'Результат выполнения QR-алгоритма Хаусхолдера:' 
               write(*,'('//f1//'(4x, '//RF//', 4x, '//RF//'))') matrix
               write(*,'()')

          end associate
          
     end procedure hqr_alg_with_rayleigh_quotient_shift_loud
     
end submodule hqr_alg_with_rayleigh_quotient_shift_loud_s