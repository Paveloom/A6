submodule ( lsm_m ) lsm_exponential_s ! Подмодуль, содержащий процедуру для вызова
                                      ! метода наименьших квадратов для экспоненциальной функции
implicit none
     
     contains
     
     ! Процедура для вызова метода наименьших квадратов для экспоненциальной функции
     module procedure lsm_exponential
          
          real(RP) :: a, b ! Коэффициенты
          real(RP) :: lnb  ! Натуральный логарифм от коэффициента b
          real(RP) :: err  ! Погрешность метода

          real(RP) :: X2   ! Сумма x^2_i-ых
          real(RP) :: X    ! Сумма x_i-ых
          real(RP) :: XlnY ! Сумма (x_i * ln(y_i))-ых
          real(RP) :: lnY  ! Сумма ln(y_i)-ых

          integer(IP) :: N ! Длина матрицы входных данных
          real(RP) :: N_RP ! Овеществление N

          integer(SP) :: stat ! Статусная переменная

          real(RP), allocatable, dimension(:) :: ln_row2 ! Держатель для log(matrix(:, 2))

          associate ( matrix => input%matrix )

               ! Вычисление длины матрицы входных данных
               N = size(matrix(:, 1))
          
               ! Овеществление N
               N_RP = real(N, kind = RP)

               ! Выделение памяти под ln_row2
               allocate(ln_row2(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_ln_row2')

               ! Вычисление ln_row2
               ln_row2 = log(matrix(:, 2))

               ! Вычисление сумм
               X2   = sum(matrix(:, 1) ** 2)
               X    = sum(matrix(:, 1))
               XlnY = sum(matrix(:, 1) * ln_row2)
               lnY  = sum(ln_row2)

               ! Вычисление коэффициента a
               a = ( XlnY * N_RP - lnY * X ) / ( X2 * N_RP - X * X )

               ! Вычисление логарифма от коэффициента b
               lnb = ( lnY - a * X ) / N_RP

               ! Вычисление коэффициента b
               b = exp(lnb)

               ! Вычисление погрешности метода
               err = sum( ( matrix(:, 2) - b * exp(a * matrix(:, 1)) ) ** 2 )

               ! Запись результата в объект
               call result%put_ls_ftype('exponential')
               call result%put_coefs([a, b])
               call result%put_err(err)

               ! Освобождение памяти из-под ln_row2
               deallocate(ln_row2, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_ln_row2')

          end associate
          
     end procedure lsm_exponential
     
end submodule lsm_exponential_s