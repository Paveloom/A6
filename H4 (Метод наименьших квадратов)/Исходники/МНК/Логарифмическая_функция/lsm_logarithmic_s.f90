submodule ( lsm_m ) lsm_logarithmic_s ! Подмодуль, содержащий процедура для вызова
                                      ! метода наименьших квадратов для логарифмической функции
implicit none
     
     contains
     
     ! Процедура для вызова метода наименьших квадратов для логарифмической функции
     module procedure lsm_logarithmic
          
          real(RP) :: a, b ! Коэффициенты
          real(RP) :: err  ! Погрешность метода

          real(RP) :: ln2X ! Сумма ln^2(x_i)-ых
          real(RP) :: lnX  ! Сумма ln(x_i)-ых
          real(RP) :: YlnX ! Сумма (y_i * ln(x_i))-ых
          real(RP) :: Y    ! Сумма y_i-ых

          integer(IP) :: N ! Длина матрицы входных данных
          real(RP) :: N_RP ! Овеществление N

          integer(SP) :: stat ! Статусная переменная

          real(RP), allocatable, dimension(:) :: ln_row ! Держатель для log(matrix(:, 1))

          associate ( matrix => input%matrix )

               ! Вычисление длины матрицы входных данных
               N = size(matrix(:, 1))
          
               ! Овеществление N
               N_RP = real(N, kind = RP)

               ! Выделение памяти под ln_row
               allocate(ln_row(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_ln_row')

               ! Вычисление ln_row
               ln_row = log(matrix(:, 1))

               ! Вычисление сумм
               ln2X = sum(ln_row ** 2)
               lnX  = sum(ln_row)
               YlnX = sum(matrix(:, 2) * ln_row)
               Y    = sum(matrix(:, 2))

               ! Вычисление коэффициента a
               a = ( YlnX * N_RP - Y * lnX ) / ( ln2X * N_RP - lnX * lnX )

               ! Вычисление коэффициента b
               b = ( Y - a * lnX ) / N_RP

               ! Вычисление погрешности метода
               err = sum( (matrix(:, 2) - a * ln_row - b) ** 2 )

               ! Запись результата в объект
               call result%put_ls_ftype('logarithmic')
               call result%put_coefs([a, b])
               call result%put_err(err)

               ! Освобождение памяти из-под ln_row
               deallocate(ln_row, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_ln_row')

          end associate

     end procedure lsm_logarithmic
     
end submodule lsm_logarithmic_s