submodule ( lsm_m ) lsm_quadratic_s ! Подмодуль, содержащий процедуру для вызова
                                    ! метода наименьших квадратов для квадратичной функции
implicit none
     
     contains
     
     ! Процедура для вызова метода наименьших квадратов для квадратичной функции
     module procedure lsm_quadratic
          
          real(RP) :: a, b, c ! Коэффициенты
          real(RP) :: err ! Погрешность метода

          real(RP) :: X4  ! Сумма x^4_i-ых
          real(RP) :: X3  ! Сумма x^3_i-ых
          real(RP) :: X2  ! Сумма x^2-i-ых
          real(RP) :: X2Y ! Сумма (x^2_i * y_i)-ых
          real(RP) :: X   ! Сумма x_i-ых
          real(RP) :: XY  ! Сумма (x_i * y_i)-ых
          real(RP) :: Y   ! Сумма y_i-ых

          ! Вспомогательные коэффициенты
          real(RP) :: c1, c2, c3

          integer(IP) :: N ! Длина матрицы входных данных
          real(RP) :: N_RP ! Овеществление N

          integer(SP) :: stat ! Статусная переменная

          real(RP), allocatable, dimension(:) :: sq_row ! Держатель для (matrix(:, 1)) ** 2

          associate ( matrix => input%matrix )

               ! Вычисление длины матрицы входных данных
               N = size(matrix(:, 1))
          
               ! Овеществление N
               N_RP = real(N, kind = RP)

               ! Выделение памяти под ln_row2
               allocate(sq_row(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_sq_row')

               ! Вычисление ln_row2
               sq_row = matrix(:, 1) ** 2

               ! Вычисление сумм
               X4  = sum(sq_row ** 2)
               X3  = sum(sq_row * matrix(:, 1))
               X2  = sum(sq_row)
               X2Y = sum(sq_row * matrix(:, 2))
               X   = sum(matrix(:, 1))
               XY  = sum(matrix(:, 1) * matrix(:, 2))
               Y   = sum(matrix(:, 2))

               ! Вычисление вспомогательных коэффициентов
               c1 = X2 * N_RP - X * X
               c2 = X * X2 - N_RP * X3
               c3 = X * X3 - X2 * X2

               ! Вычисление коэффициента a
               a = ( X2Y * c1 + XY * c2 + Y * c3 ) / ( X4 * c1 + X3 * c2 + X2 * c3 ) 

               ! Вычисление коэффициента b
               b = ( a * c2 + N_RP * XY - X * Y ) / ( X2 * N_RP - X * X )

               ! Вычисление коэффициента c
               c = ( - a * X2 - b * X + Y ) / N_RP

               ! Вычисление погрешности метода
               err = sum( ( matrix(:, 2) - a * sq_row - b * matrix(:, 1) - c ) ** 2 )

               ! Запись результата в объект
               call result%put_ls_ftype('quadratic')
               call result%put_coefs([a, b, c])
               call result%put_err(err)

               ! Освобождение памяти из-под ln_row2
               deallocate(sq_row, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_sq_row')

          end associate
          
     end procedure lsm_quadratic
     
end submodule lsm_quadratic_s