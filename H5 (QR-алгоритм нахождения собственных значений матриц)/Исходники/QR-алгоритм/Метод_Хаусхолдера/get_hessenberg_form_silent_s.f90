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

          complex(CP), dimension(1, input%N - 1) :: u  ! Вектор Хаусхолдера
          complex(CP), dimension(input%N - 1, 1) :: us ! Эрмитово-сопряженный вектор Хаусхолдера

          complex(CP) :: ro ! Коэффициент перед нормой
          real(RP) :: arg ! Аргумент комплексного числа matrix(k, k_p1)
          real(RP) :: subcolumn_norm ! Норма k-го столбца ниже главной диагонали (включительно)

          integer(JP) :: i, k ! Вспомогательные переменные
          integer(JP) :: k_p1 ! Держатель для k + 1
          integer(IP) :: Nmk  ! Держатель для N - k

          associate ( matrix => input%matrix, & ! Матрица объекта 
                    &      N => input%N       ) ! Число строк матрицы

               reduction : do k = 1, N - 2 ! Преобразование

                    ! [ Вычисление вспомогательных переменных ]
                    k_p1 = k + 1
                    Nmk  = N - k

                    ! [ Вычисление нормы k-го подвектора ]
                    subcolumn_norm = norm2( abs(matrix(k, k_p1:N)) )

                    ! [ Вычисление аргумента комплексного числа matrix(k, k_p1) ]
                    arg = atan2( aimag(matrix(k, k_p1)), real(matrix(k, k_p1)) )

                    ! [ Вычисление коэффициента перед нормой ]
                    ro = exp( cmplx(0._RP, arg, kind = CP) )

                    ! [ Обнуление вектора Хаусхолдера ]
                    u = (0._RP, 0._RP)

                    ! [ Генерация вектора Хаусхолдера (по алгоритму из PDF) ]

                    u(1, 1) = ro * subcolumn_norm

                    u(1, 1:Nmk) = matrix(k, k_p1:N) + u(1, 1:Nmk)

                    subcolumn_norm = norm2(abs(u))

                    u(1, 1:Nmk) = u(1, 1:Nmk) / cmplx(subcolumn_norm, 0._RP, kind = CP)

                    ! [ Умножение на матрицу отражения слева ]

                    us = reshape( source = u , shape = (/ input%N - 1, 1 /))
                    us = conjg(us)

                    matrix(k:N, k_p1:N) = matrix(k:N, k_p1:N) - 2._RP * matmul( matmul( matrix(k:N, k_p1:N), us(1:Nmk, 1:1) ), u(1:1, 1:Nmk) )
                    
                    ! [ Умножение на матрицу отражения справа ]

                    matrix(k_p1:N, 1:N) = matrix(k_p1:N, 1:N) - 2._RP * matmul( us(1:Nmk, 1:1), matmul( u(1:1, 1:Nmk), matrix(k_p1:N, 1:N) ) )

                    ! [ Обнуление малых чисел ]

                    nullification : do i = k_p1 + 1, N 
                         
                         if ( abs(real(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( 0._RP, aimag(matrix(k, i)), kind = CP )
                         if ( abs(aimag(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( real(matrix(k, i)), 0._RP, kind = CP )

                    enddo nullification

               enddo reduction

          end associate
          
     end procedure get_hessenberg_form_silent
     
end submodule get_hessenberg_form_silent_s