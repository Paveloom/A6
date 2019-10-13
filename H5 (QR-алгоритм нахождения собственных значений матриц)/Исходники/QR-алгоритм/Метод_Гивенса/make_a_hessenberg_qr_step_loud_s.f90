submodule ( givens_rotations_m ) make_a_hessenberg_qr_step_loud_s ! Подмодуль, содержащий процедуру, 
                                                                  ! выполняющую шаг QR-разложения
                                                                  ! и RQ-композиции для матрицы Хессенберга
                                                                  ! с дополнительным выводом
implicit none
     
     contains
     
     ! Процедура, выполняющая шаг QR-разложения
     ! и RQ-композиции для матрицы Хессенберга
     ! с дополнительным выводом
     module procedure make_a_hessenberg_qr_step_loud

          complex(CP), dimension(1:2 * m - 2) :: coefs ! Массив коэффициентов поворота
          complex(CP), dimension(2, 2) :: coefs_matrix ! Матрица вращения

          integer(JP) :: k ! Вспомогательная переменная
          integer(JP) :: k_p1 ! Держатель для k + 1
          integer(JP) :: k_m1 ! Держатель для k - 1
          integer(JP) :: l_index, r_index ! Держатели индексов для массива coefs

          integer(JP) :: i
          
          associate ( matrix => input%matrix ) ! Матрица объекта 

               ! [ Умножение на матрицы вращений слева ]

               left : do k = 1, m - 1

                    ! [ Вычисление вспомогательных индексов ]

                    k_m1 = k - 1
                    k_p1 = k + 1

                    ! [ Вычисление индексов для расположения пары коэффициентов вращения в массиве coefs ] 

                    l_index = 1 + 2 * k_m1
                    r_index = 2 + 2 * k_m1

                    ! [ Получение коэффициентов c и s, необходимых для осуществления поворота Гивенса ] 
                    call get_givens_rotation_coefs(matrix(k, k), matrix(k, k_p1), coefs(l_index), coefs(r_index))

                    ! [ Формирование матрицы вращения ]
                    coefs_matrix = reshape( source = [coefs(l_index), coefs(r_index), - conjg(coefs(r_index)), coefs(l_index)], shape = [2, 2])

                    ! [ Воздействие матрицей вращения на элементы k-го столбца с k-ой по (k + 1)-ю строку ]
                    matrix(k:m, k:k_p1) = matmul(matrix(k:m, k:k_p1), coefs_matrix(1:2, 1:2))

               enddo left

               ! [ Умножение на матрицы вращений справа ]

               right : do k = 1, m - 1

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

               ! write(*,'(3(4x, e22.15, 4x, e22.15))') matrix

          end associate
          
     end procedure make_a_hessenberg_qr_step_loud
     
end submodule make_a_hessenberg_qr_step_loud_s