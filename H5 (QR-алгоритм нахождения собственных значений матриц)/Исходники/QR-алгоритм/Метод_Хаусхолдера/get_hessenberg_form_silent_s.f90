submodule ( householder_reduction_m ) get_hessenberg_form_silent_s ! Подмодуль, содержащий процедуру, 
                                                                   ! реализующую метод Хаусхолдера для приведения исходной
                                                                   ! матрицы к матрице Хессенберга (почти треугольной матрице)
                                                                   ! без дополнительного вывода
implicit none
     
     contains
     
     ! Процедура, реализующая метод Хаусхолдера для приведения исходной
     ! матрицы к матрице Хессенберга (почти треугольной матрице)
     ! без дополнительного вывода
     module procedure get_hessenberg_form_silent

          complex(CP), dimension(1_JP, int(input%N, kind = JP) - 1_JP) :: u  ! Вектор Хаусхолдера
          complex(CP), dimension(int(input%N, kind = JP) - 1_JP, 1_JP) :: us ! Эрмитово-сопряженный вектор Хаусхолдера

          integer(JP) :: N_JP ! Число строк матрицы, записанное в целочисленную переменную точности JP

          complex(CP) :: ro ! Коэффициент перед нормой
          real(RP) :: arg ! Аргумент комплексного числа matrix(k, k_p1)
          real(RP) :: subcolumn_norm ! Норма k-го столбца ниже главной диагонали (включительно)

          integer(JP) :: i, k ! Вспомогательные переменные
          integer(JP) :: k_p1 ! Держатель для k + 1
          integer(IP) :: Nmk  ! Держатель для N - k

          associate ( matrix => input%matrix, & ! Матрица объекта 
                    &      N => input%N       ) ! Число строк матрицы

               ! Присваивание значения N_JP
               N_JP = int(N, kind = JP)

               reduction : do k = 1_JP, N_JP - 2_JP ! Преобразование

                    ! [ Вычисление вспомогательных переменных ]
                    k_p1 = k + 1_JP
                    Nmk  = N_JP - k

                    ! [ Вычисление нормы k-го подвектора ]
                    subcolumn_norm = norm2( abs(matrix(k, k_p1:N_JP)) )

                    ! [ Вычисление аргумента комплексного числа matrix(k, k_p1) ]
                    arg = atan2( aimag(matrix(k, k_p1)), real(matrix(k, k_p1)) )

                    ! [ Вычисление коэффициента перед нормой ]
                    ro = exp( cmplx(0._RP, arg, kind = CP) )

                    ! [ Обнуление вектора Хаусхолдера ]
                    u = (0._RP, 0._RP)

                    ! [ Генерация вектора Хаусхолдера (по алгоритму из PDF) ]

                    u(1_JP, 1_JP) = ro * subcolumn_norm

                    u(1_JP, 1_JP:Nmk) = matrix(k, k_p1:N_JP) + u(1_JP, 1_JP:Nmk)

                    subcolumn_norm = norm2(abs(u))

                    u(1_JP, 1_JP:Nmk) = u(1_JP, 1_JP:Nmk) / cmplx(subcolumn_norm, 0._RP, kind = CP)

                    ! [ Умножение на матрицу отражения слева ]

                    us = reshape( source = u , shape = (/ N_JP - 1_JP, 1_JP /))
                    us = conjg(us)

                    matrix(k:N_JP, k_p1:N_JP) = matrix(k:N_JP, k_p1:N_JP) - 2._RP * matmul( matmul( matrix(k:N_JP, k_p1:N_JP), us(1_JP:Nmk, 1_JP:1_JP) ), u(1_JP:1_JP, 1_JP:Nmk) )
                    
                    ! [ Умножение на матрицу отражения справа ]

                    matrix(k_p1:N_JP, 1_JP:N_JP) = matrix(k_p1:N_JP, 1_JP:N_JP) - 2._RP * matmul( us(1_JP:Nmk, 1_JP:1_JP), matmul( u(1_JP:1_JP, 1_JP:Nmk), matrix(k_p1:N_JP, 1_JP:N_JP) ) )

                    ! [ Обнуление малых чисел ]

                    nullification : do i = k_p1 + 1_JP, N_JP 
                         
                         if ( abs(real(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( 0._RP, aimag(matrix(k, i)), kind = CP )
                         if ( abs(aimag(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( real(matrix(k, i)), 0._RP, kind = CP )

                    enddo nullification

               enddo reduction

          end associate
          
     end procedure get_hessenberg_form_silent
     
end submodule get_hessenberg_form_silent_s