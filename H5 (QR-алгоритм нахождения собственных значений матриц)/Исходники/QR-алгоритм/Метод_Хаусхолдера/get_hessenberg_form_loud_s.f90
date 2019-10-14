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

          complex(CP), dimension(1, input%N - 1) :: u  ! Вектор Хаусхолдера
          complex(CP), dimension(input%N - 1, 1) :: us ! Эрмитово-сопряженный вектор Хаусхолдера

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

               ! Запись числа N в строку
               write(f1, '(i2)') IP
               write(f2,'(i'//f1//')') N

               ! Вывод исходной матрицы
               write(*,'(/, 5x, a, /)') 'Исходная матрица: '
               write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
               write(*,'()')

               ! Запись JP в строку
               write(f4,'(i1)') JP

               reduction : do k = 1, N - 2 ! Преобразование

                    write(f3, '(i'//f4//')') k
                    write(*,'(5x, a, a, /)') 'k = ', trim(adjustl(f3))

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

                    write(*,'(5x, a, /)') 'Генерация вектора Хаусхолдера: '

                    ! Запись числа N - k в строку
                    write(f3,'(i'//f1//')') Nmk

                    write(*,'(5x, "1) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)

                    u(1, 1) = ro * subcolumn_norm

                    write(*,'(5x, "2) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)

                    u(1, 1:Nmk) = matrix(k, k_p1:N) + u(1, 1:Nmk)

                    write(*,'(5x, "3) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)

                    subcolumn_norm = norm2(abs(u))

                    u(1, 1:Nmk) = u(1, 1:Nmk) / cmplx(subcolumn_norm, 0._RP, kind = CP)

                    write(*,'(5x, "4) ", '//f3//'("(", '//RF//', ", ", '//RF//', " )", 5x))') u(1, 1:Nmk)
                    write(*,'()')

                    ! [ Умножение на матрицу отражения слева ]

                    write(*,'(5x, a, /)') 'Умножение на матрицу отражения слева: '

                    us = reshape( source = u , shape = (/ input%N - 1, 1 /))
                    us = conjg(us)

                    matrix(k:N, k_p1:N) = matrix(k:N, k_p1:N) - 2._RP * matmul( matmul( matrix(k:N, k_p1:N), us(1:Nmk, 1:1) ), u(1:1, 1:Nmk) )
                    
                    write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
                    write(*,'()')

                    ! [ Умножение на матрицу отражения справа ]

                    write(*,'(5x, a, /)') 'Умножение на матрицу отражения справа: '

                    matrix(k_p1:N, 1:N) = matrix(k_p1:N, 1:N) - 2._RP * matmul( us(1:Nmk, 1:1), matmul( u(1:1, 1:Nmk), matrix(k_p1:N, 1:N) ) )

                    write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
                    write(*,'()')

                    ! [ Обнуление малых чисел ]

                    write(*,'(5x, a, /)') 'Обнуление малых чисел (только в текущем подстолбце): '

                    nullification : do i = k_p1 + 1, N 
                         
                         if ( abs(real(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( 0._RP, aimag(matrix(k, i)), kind = CP )
                         if ( abs(aimag(matrix(k, i))) .le. 1e-10_RP ) matrix(k, i) = cmplx( real(matrix(k, i)), 0._RP, kind = CP )

                    enddo nullification

                    write(*,'('//f2//'(4x, '//RF//', 4x, '//RF//'))') matrix
                    write(*,'()')

               enddo reduction

          end associate
          
     end procedure get_hessenberg_form_loud
     
end submodule get_hessenberg_form_loud_s