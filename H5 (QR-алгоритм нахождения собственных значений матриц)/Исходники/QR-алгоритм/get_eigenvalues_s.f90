submodule ( qr_alg_m ) get_eigenvalues_s ! Подмодуль, содержащий процедуру главного 
                                         ! вызова модифицированного QR-алгоритма для
                                         ! нахождения значений собственных чисел квадратных матриц
implicit none
     
     contains
     
     ! Процедура главного вызова модифицированного QR-алгоритма
     ! для нахождения значений собственных чисел квадратных матриц
     module procedure get_eigenvalues

          complex(CP), dimension(1:2 * input%N - 2) :: coefs ! Массив коэффициентов поворота
          complex(CP), dimension(2, 2) :: coefs_matrix ! Матрица вращения

          integer(JP) :: k, i ! Вспомогательная переменная
          integer(JP) :: k_p1 ! Держатель для k + 1
          integer(JP) :: k_m1 ! Держатель для k - 1
          integer(JP) :: l_index, r_index ! Держатели индексов для массива coefs

          ! real(RP) :: c
          ! complex(CP) :: s
          
          ! [ Вызов метода Хаусхолдера для преобразования ]
          ! [ исходной матрицы к матрице Хессенберга      ]
          call get_hessenberg_form(input, settings)

          associate ( matrix => input%matrix, & ! Матрица объекта 
                    &      N => input%N       ) ! Число строк матрицы

               ! call get_givens_rotation_coefs_loud(matrix(1, 1), matrix(1, 2), c, s)

               write(*,'(3(4x, e22.15, 4x, e22.15))') matrix
               write(*,'()')

               ! [ Умножение на матрицы вращений слева ]

               do i = 1, 30

               left : do k = 1, N - 1

                    ! [ Вычисление вспомогательных индексов ]

                    k_m1 = k - 1
                    k_p1 = k + 1

                    ! [ Вычисление индексов для расположения пары коэффициентов вращения в массиве coefs ] 

                    l_index = 1 + 2 * k_m1
                    r_index = 2 + 2 * k_m1

                    ! [ Получение коэффициентов c и s, необходимых для осуществления поворота Гивенса ] 
                    call get_givens_rotation_coefs_loud(matrix(k, k), matrix(k, k_p1), coefs(l_index), coefs(r_index))

                    ! [ Формирование матрицы вращения ]
                    coefs_matrix = reshape( source = [coefs(l_index), coefs(r_index), - conjg(coefs(r_index)), coefs(l_index)], shape = [2, 2])

                    ! [ Воздействие матрицей вращения на элементы k-го столбца с k-ой по (k + 1)-ю строку ]
                    matrix(k:N, k:k_p1) = matmul(matrix(k:N, k:k_p1), coefs_matrix(1:2, 1:2))

                    write(*,'(3(4x, e22.15, 4x, e22.15))') matrix
                    write(*,'()')

               enddo left

               ! [ Умножение на матрицы вращений справа ]

               right : do k = 1, N - 1

                    ! [ Вычисление вспомогательных индексов ]

                    k_m1 = k - 1
                    k_p1 = k + 1

                    ! [ Вычисление индексов расположенной пары коэффициентов вращения в массиве coefs ] 

                    l_index = 1 + 2 * k_m1
                    r_index = 2 + 2 * k_m1

                    ! [ Формирование матрицы вращения ]
                    coefs_matrix = reshape( source = [coefs(l_index), coefs(r_index), - conjg(coefs(r_index)), coefs(l_index)], shape = [2, 2], order = [2, 1] )

                    ! [ Умножение матрицы вращения справа ]
                    matrix(k:k_p1, 1:k_p1) = matmul(coefs_matrix, matrix(k:k_p1, 1:k_p1))

               enddo right

               enddo

               write(*,'(3(4x, e22.15, 4x, e22.15))') matrix
               write(*,'()')

          end associate

     end procedure get_eigenvalues
     
end submodule get_eigenvalues_s