submodule ( lsm_m ) lsm_all_s ! Подмодуль, содержащий процедуру для вызова
                              ! метода наименьших квадратов для перебора функций
implicit none
     
     contains
     
     ! Процедура для вызова метода наименьших квадратов для перебора функций
     module procedure lsm_all
          
          ! Массивы коэффициентов для следующих типов функций:
          ! линейная, гиперболическая, логарифмическая, экспоненциальная
          real(RP), allocatable, dimension(:) :: a, b

          ! Коэффициенты для квадратичной функции
          real(RP) :: a_quad, b_quad, c_quad

          ! Массив погрешностей метода для всех типов функций
          real(RP), allocatable, dimension(:) :: err

          ! Все суммы линейной функции
          real(RP) :: X  ! Сумма x_i-ых
          real(RP) :: X2 ! Сумма x^2_i-ых
          real(RP) :: Y  ! Сумма y_i-ых
          real(RP) :: XY ! Сумма (x_i * y_i)-ых

          ! Уникальные суммы гиперболической функции
          real(RP) :: rX2 ! Сумма (1 / x^2_i)-ых
          real(RP) :: rX  ! Сумма (1 / x_i)-ых
          real(RP) :: YrX ! Сумма (y_i / x_i)-ых

          ! Уникальные суммы логарифмической функции
          real(RP) :: ln2X ! Сумма ln^2(x_i)-ых
          real(RP) :: lnX  ! Сумма ln(x_i)-ых
          real(RP) :: YlnX ! Сумма (y_i * ln(x_i))-ых

          ! Уникальные суммы экспоненциальной функции
          real(RP) :: XlnY ! Сумма (x_i * ln(y_i))-ых
          real(RP) :: lnY  ! Сумма ln(y_i)-ых

          ! Уникальные суммы квадратичной функции
          real(RP) :: X4  ! Сумма x^4_i-ых
          real(RP) :: X3  ! Сумма x^3_i-ых
          real(RP) :: X2Y ! Сумма (x^2_i * y_i)-ых

          ! Вспомогательные коэффициенты
          real(RP) :: c1, c2, c3, a1

          ! Вспомогательные массивы
          real(RP), allocatable, dimension(:) :: r_row   ! Держатель для 1._RP / matrix(:, 1)
          real(RP), allocatable, dimension(:) :: ln_row  ! Держатель для log(matrix(:, 1))
          real(RP), allocatable, dimension(:) :: ln_row2 ! Держатель для log(matrix(:, 2))
          real(RP), allocatable, dimension(:) :: sq_row  ! Держатель для (matrix(:, 1)) ** 2

          integer(IP) :: N ! Длина матрицы входных данных
          real(RP) :: N_RP ! Овеществление N

          integer(SP) :: stat ! Статусная переменная

          associate ( matrix => input%matrix )

               ! Вычисление длины матрицы входных данных
               N = size(matrix(:, 1))
          
               ! Овеществление N
               N_RP = real(N, kind = RP)

               ! Выделение памяти под основные массивы

               allocate(a(4), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_a')

               allocate(b(4), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_b')

               allocate(err(5), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_err')

               ! [ Выделение памяти под вспомогательные массивы ]

               ! Выделение памяти под r_row
               allocate(r_row(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_r_row')

               ! Выделение памяти под ln_row
               allocate(ln_row(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_ln_row')

               ! Выделение памяти под ln_row2
               allocate(ln_row2(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_ln_row2')

               ! Выделение памяти под sq_row
               allocate(sq_row(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_sq_row')

               ! Вычисление r_row
               r_row = 1._RP / matrix(:, 1)

               ! Вычисление ln_row
               ln_row = log(matrix(:, 1))

               ! Вычисление ln_row2
               ln_row2 = log(matrix(:, 2))

               ! Вычисление sq_row
               sq_row = matrix(:, 1) ** 2

               ! [ Вычисление сумм ]

               ! Все суммы линейной функции

               X  = sum(matrix(:, 1))
               X2 = sum(matrix(:, 1) ** 2)
               Y  = sum(matrix(:, 2))
               XY = sum(matrix(:, 1) * matrix(:, 2))

               ! Уникальные суммы гиперболической функции

               rX2 = sum(r_row ** 2)
               rX  = sum(r_row)
               YrX = sum(matrix(:, 2) * r_row)

               ! Уникальные суммы логарифмической функции

               ln2X = sum(ln_row ** 2)
               lnX  = sum(ln_row)
               YlnX = sum(matrix(:, 2) * ln_row)

               ! Уникальные суммы экспоненциальной функции

               XlnY = sum(matrix(:, 1) * ln_row2)
               lnY  = sum(ln_row2)

               ! Уникальные суммы квадратичной функции

               X4  = sum(sq_row ** 2)
               X3  = sum(sq_row * matrix(:, 1))
               X2Y = sum(sq_row * matrix(:, 2))

               ! Вычисление вспомогательных коэффициентов
               a1 = X * X

               c1 = X2 * N_RP - a1
               c2 = X * X2 - N_RP * X3
               c3 = X * X3 - X2 * X2

               ! [ Вычисление коэффициентов ]

               ! Вычисление коэффициентов a

               a = ( [XY, YrX, YlnX, XlnY] * N_RP - [Y, Y, Y, lnY] * [X, rX, lnX, X] ) / ( [X2, rX2, ln2X, X2] * N_RP - [X, rX, lnX, X] * [X, rX, lnX, X] )
               a_quad = ( X2Y * c1 + XY * c2 + Y * c3 ) / ( X4 * c1 + X3 * c2 + X2 * c3 ) 

               ! Вычисление коэффициентов b

               b = ( [Y, Y, Y, lnY] - a * [X, rX, lnX, X] ) / N_RP
               b(4) = exp(b(4))
               b_quad = ( a_quad * c2 + N_RP * XY - X * Y ) / ( X2 * N_RP - a1 )

               ! Вычисление коэффициента c

               c_quad = ( - a_quad * X2 - b_quad * X + Y ) / N_RP

               ! [ Вычисление погрешностей методов ]

               err(1) = sum( (matrix(:, 2) - a(1) * matrix(:, 1) - b(1)) ** 2 )
               err(2) = sum( (matrix(:, 2) - a(2) * r_row - b(2)) ** 2 )
               err(3) = sum( (matrix(:, 2) - a(3) * ln_row - b(3)) ** 2 )
               err(4) = sum( ( matrix(:, 2) - b(4) * exp(a(4) * matrix(:, 1)) ) ** 2 )
               err(5) = sum( ( matrix(:, 2) - a_quad * sq_row - b_quad * matrix(:, 1) - c_quad ) ** 2 )

               ! Запись результата в объект
               call result%put_ls_ftype('all')
               call result%put_coefs([a, b, a_quad, b_quad, c_quad])
               call result%put_err_array(err)

               ! Освобождение памяти из-под основных массивов

               deallocate(a, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_a')

               deallocate(b, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_b')

               deallocate(err, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_err')

               ! Освобождение памяти из-под вспомогательных массивов

               ! Освобождение памяти из-под r_row
               deallocate(r_row, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_r_row')

               ! Освобождение памяти из-под ln_row
               deallocate(ln_row, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_ln_row')

               ! Освобождение памяти из-под ln_row2
               deallocate(ln_row2, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_ln_row2')

               ! Освобождение памяти из-под sq_row
               deallocate(sq_row, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_sq_row')
               
          end associate
          
     end procedure lsm_all
     
end submodule lsm_all_s