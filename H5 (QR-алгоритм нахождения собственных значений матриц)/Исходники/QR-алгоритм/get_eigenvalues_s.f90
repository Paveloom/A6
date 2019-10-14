submodule ( qr_alg_m ) get_eigenvalues_s ! Подмодуль, содержащий процедуру главного 
                                         ! вызова модифицированного QR-алгоритма для
                                         ! нахождения значений собственных чисел квадратных матриц
implicit none
     
     contains
     
     ! Процедура главного вызова модифицированного QR-алгоритма
     ! для нахождения значений собственных чисел квадратных матриц
     module procedure get_eigenvalues

          ! [ Вызов метода Хаусхолдера для преобразования ]
          ! [ исходной матрицы к матрице Хессенберга      ]
          call get_hessenberg_form(input, settings)

          ! Проверка, является ли матрица вещественной
          if (matrix_is_purely_real(input)) then

               write(*,'(/, 5x, a)') 'Матрица Хессенберга вещественна, поэтому будет вызван&
                                    & QR-алгоритм Фрэнсиса с двойным сдвигом.'

               ! [ Вызов QR-алгоритма Фрэнсиса с двойным сдвигом ]
               call francis_double_step_qr_alg(input, result, settings)

          ! Проверка, является ли матрица эрмитовой
          elseif (matrix_is_hermitian(input)) then

               write(*,'(/, 5x, a)') 'Матрица Хессенберга эрмитова, поэтому будет вызван&
                                    & QR-алгоритм Хаусхолдера со сдвигом по&
                                    & отношению Релея.'

               ! [ Вызов QR-алгоритма Хаусхолдера со ]
               ! [ сдвигом по отношению Релея        ]
               call hqr_alg_with_rayleigh_quotient_shift(input, result, settings)

          else

               write(*,'(/, 5x, a)') 'Матрица Хессенберга ни вещественна, ни эрмитова.&
                                    & Нет подходящих алгоритмов.'

          endif

     end procedure get_eigenvalues
     
end submodule get_eigenvalues_s