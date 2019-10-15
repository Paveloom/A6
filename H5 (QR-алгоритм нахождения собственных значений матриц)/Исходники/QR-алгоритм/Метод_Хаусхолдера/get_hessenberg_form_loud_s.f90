submodule ( householder_reduction_m ) get_hessenberg_form_loud_s ! Подмодуль, содержащий процедуру, 
                                                                 ! реализующую метод Хаусхолдера для приведения исходной
                                                                 ! матрицы к матрице Хессенберга (почти треугольной матрице)
                                                                 ! с дополнительным выводом
implicit none
     
     contains
     
     ! Процедура, реализующая метод Хаусхолдера для приведения исходной
     ! матрицы к матрице Хессенберга (почти треугольной матрице)
     ! с дополнительным выводом
     module procedure get_hessenberg_form_loud

          complex(CP), dimension(1_JP, int(input%N, kind = JP) - 1_JP) :: u  ! Вектор Хаусхолдера
          complex(CP), dimension(int(input%N, kind = JP) - 1_JP, 1_JP) :: us ! Эрмитово-сопряженный вектор Хаусхолдера

          integer(JP) :: N_JP ! Число строк матрицы, записанное в целочисленную переменную точности JP

          complex(CP) :: ro ! Коэффициент перед нормой
          real(RP) :: arg ! Аргумент комплексного числа matrix(k, k_p1)
          real(RP) :: subcolumn_norm ! Норма k-го столбца ниже главной диагонали (включительно)

          integer(JP) :: i, k ! Вспомогательные переменные
          integer(JP) :: k_p1 ! Держатель для k + 1
          integer(IP) :: Nmk  ! Держатель для N - k

          character(FP) :: f1, f2, f3, f4 ! Вспомогательные строки для автоформатирования

          write(*,'(/, 5x, a)') 'Преобразование Хаусхолдера'
          
          associate ( matrix => input%matrix, & ! Матрица объекта 
                    &      N => input%N       ) ! Число строк матрицы

               ! Присваивание значения N_JP
               N_JP = int(N, kind = JP)
                    
               ! Запись числа N в строку
               write(f1, '(i2)') IP
               write(f2,'(i'//f1//')') N

               ! Вывод исходной матрицы
               write(*,'(/, 5x, a, /)') 'Исходная матрица: '
               write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
               write(*,'()')

               ! Запись JP в строку
               write(f4,'(i1)') JP

               reduction : do k = 1_JP, N_JP - 2_JP ! Преобразование

                    write(f3, '(i'//f4//')') k
                    write(*,'(5x, a, a, /)') 'k = ', trim(adjustl(f3))

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

                    write(*,'(5x, a, /)') 'Генерация вектора Хаусхолдера: '

                    ! Запись числа N - k в строку
                    write(f3,'(i'//f1//')') Nmk

                    write(*,'(5x, "1) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)

                    u(1_JP, 1_JP) = ro * cmplx(subcolumn_norm, 0._RP, kind = CP)

                    write(*,'(5x, "2) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)

                    u(1_JP, 1_JP:Nmk) = matrix(k, k_p1:N_JP) + u(1, 1:Nmk)

                    write(*,'(5x, "3) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)

                    subcolumn_norm = norm2(abs(u))

                    u(1_JP, 1_JP:Nmk) = u(1_JP, 1_JP:Nmk) / cmplx(subcolumn_norm, 0._RP, kind = CP)

                    write(*,'(5x, "4) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1_JP, 1_JP:Nmk)
                    write(*,'()')

                    ! [ Умножение на матрицу отражения слева ]

                    write(*,'(5x, a, /)') 'Умножение на матрицу отражения слева: '

                    us = reshape( source = u , shape = [ N_JP - 1_JP, 1_JP ])
                    us = conjg(us)

                    matrix(k:N, k_p1:N) = matrix(k:N_JP, k_p1:N_JP) - cmplx(2._RP, 0._RP, kind = CP) * matmul( matmul( matrix(k:N_JP, k_p1:N_JP), us(1_JP:Nmk, 1_JP:1_JP) ), u(1_JP:1_JP, 1_JP:Nmk) )
                    
                    write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
                    write(*,'()')

                    ! [ Умножение на матрицу отражения справа ]

                    write(*,'(5x, a, /)') 'Умножение на матрицу отражения справа: '

                    matrix(k_p1:N_JP, 1_JP:N_JP) = matrix(k_p1:N_JP, 1_JP:N_JP) - cmplx(2._RP, 0._RP, kind = CP) * matmul( us(1_JP:Nmk, 1_JP:1_JP), matmul( u(1_JP:1_JP, 1_JP:Nmk), matrix(k_p1:N_JP, 1_JP:N_JP) ) )

                    write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
                    write(*,'()')

                    ! [ Обнуление малых чисел ]

                    write(*,'(5x, a, /)') 'Обнуление малых чисел (только в текущем подстолбце): '

                    nullification : do i = k_p1 + 1_JP, N_JP 
                         
                         if ( abs(real(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( 0._RP, aimag(matrix(k, i)), kind = CP )
                         if ( abs(aimag(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( real(matrix(k, i)), 0._RP, kind = CP )

                    enddo nullification

                    write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
                    write(*,'()')

               enddo reduction

          end associate
          
     end procedure get_hessenberg_form_loud
     
end submodule get_hessenberg_form_loud_s