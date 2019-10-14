submodule ( qr_alg_m ) hqr_alg_with_rayleigh_quotient_shift_s ! Подмодуль, содержащий процедуру, реализующую
                                                              ! QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
implicit none
     
     contains
     
     ! Процедура, реализующая QR-алгоритм Хаусхолдера со сдвигом по отношению Релея
     module procedure hqr_alg_with_rayleigh_quotient_shift
          
          integer(JP) :: m, i  ! Вспомогательные переменные
          complex(CP) :: sigma ! Сдвиг по отношению Релея

          real(RP) :: hqr_err ! Ограничение сверху на значение |matrix(m - 1, m)|
                              ! (условие сходимости)

          hqr_err = settings%get_hqr_err()

          associate( matrix => input%matrix, & ! Матрица объекта
                   &      N => input%N       ) ! Число строк матрицы

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
                         call make_a_hessenberg_qr_step_loud(input, m)

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

               write(*,'(3(4x, e22.15, 4x, e22.15))') matrix
               write(*,*)

          end associate
          
     end procedure hqr_alg_with_rayleigh_quotient_shift
     
end submodule hqr_alg_with_rayleigh_quotient_shift_s