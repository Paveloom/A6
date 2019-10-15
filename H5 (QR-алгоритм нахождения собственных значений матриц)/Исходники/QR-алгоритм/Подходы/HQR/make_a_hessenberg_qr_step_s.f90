submodule ( hqr_m ) make_a_hessenberg_qr_step_s ! Подмодуль, содержащий процедуру, 
                                                ! выполняющую шаг QR-разложения
                                                ! и RQ-композиции для матрицы Хессенберга
                                                ! с дополнительным выводом
implicit none
     
     contains
     
     ! Процедура, выполняющая шаг QR-разложения
     ! и RQ-композиции для матрицы Хессенберга
     ! с дополнительным выводом
     module procedure make_a_hessenberg_qr_step

          complex(CP), dimension(1_JP:2_JP * m - 2_JP) :: coefs ! Массив коэффициентов поворота
          complex(CP), dimension(2_JP, 2_JP) :: coefs_matrix ! Матрица вращения

          integer(JP) :: k ! Вспомогательная переменная
          integer(JP) :: k_p1 ! Держатель для k + 1
          integer(JP) :: k_m1 ! Держатель для k - 1
          integer(JP) :: l_index, r_index ! Держатели индексов для массива coefs

          associate ( matrix => input%matrix ) ! Матрица объекта 

               ! [ Умножение на матрицы вращений слева ]

               left : do k = 1_JP, m - 1_JP

                    ! [ Вычисление вспомогательных индексов ]

                    k_m1 = k - 1_JP
                    k_p1 = k + 1_JP

                    ! [ Вычисление индексов для расположения пары коэффициентов вращения в массиве coefs ] 

                    l_index = 1_JP + 2_JP * k_m1
                    r_index = 2_JP + 2_JP * k_m1

                    ! [ Получение коэффициентов c и s, необходимых для осуществления поворота Гивенса ] 
                    call get_givens_rotation_coefs(matrix(k, k), matrix(k, k_p1), coefs(l_index), coefs(r_index))

                    ! [ Формирование матрицы вращения ]
                    coefs_matrix = reshape( source = [coefs(l_index), coefs(r_index), - conjg(coefs(r_index)), coefs(l_index)], shape = [2_JP, 2_JP])

                    ! [ Воздействие матрицей вращения на элементы k-го столбца с k-ой по (k + 1)-ю строку ]
                    matrix(k:m, k:k_p1) = matmul(matrix(k:m, k:k_p1), coefs_matrix(1_JP:2_JP, 1_JP:2_JP))

               enddo left

               ! [ Умножение на матрицы вращений справа ]

               right : do k = 1_JP, m - 1_JP

                    ! [ Вычисление вспомогательных индексов ]

                    k_m1 = k - 1_JP
                    k_p1 = k + 1_JP

                    ! [ Вычисление индексов расположенной пары коэффициентов вращения в массиве coefs ] 

                    l_index = 1_JP + 2_JP * k_m1
                    r_index = 2_JP + 2_JP * k_m1

                    ! [ Формирование матрицы вращения ]
                    coefs_matrix = reshape( source = [coefs(l_index), coefs(r_index), - conjg(coefs(r_index)), coefs(l_index)], shape = [2_JP, 2_JP], order = [2, 1] )

                    ! [ Умножение матрицы вращения справа ]
                    matrix(k:k_p1, 1_JP:k_p1) = matmul(coefs_matrix, matrix(k:k_p1, 1_JP:k_p1))

               enddo right

          end associate
          
     end procedure make_a_hessenberg_qr_step
     
end submodule make_a_hessenberg_qr_step_s