submodule ( lsm_m ) lsm_hyperbolic_s ! Подмодуль, содержаший процедуру для вызова 
                                     ! метода наименьших квадратов для гиперболической функции
implicit none
     
     contains
     
     ! Процедура для вызова метода наименьших квадратов для гиперболической функции
     module procedure lsm_hyperbolic
          
          real(RP) :: a, b ! Коэффициенты
          real(RP) :: err  ! Погрешность метода

          real(RP) :: rX2 ! Сумма (1 / x^2_i)-ых
          real(RP) :: rX  ! Сумма (1 / x_i)-ых
          real(RP) :: YrX ! Сумма (y_i / x_i)-ых
          real(RP) :: Y   ! Сумма y_i-ых

          integer(IP) :: N ! Длина матрицы входных данных
          real(RP) :: N_RP ! Овеществление N

          integer(SP) :: stat ! Статусная переменная

          real(RP), allocatable, dimension(:) :: r_row ! Держатель для 1._RP / matrix(:, 1)

          associate (matrix => input%matrix)

               ! Вычисление длины матрицы входных данных
               N = size(matrix(:, 1))
          
               ! Овеществление N
               N_RP = real(N, kind = RP)
          
               ! Выделение памяти под r_row
               allocate(r_row(N), stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WA_r_row')

               ! Вычисление r_row
               r_row = 1._RP / matrix(:, 1)

               ! Вычисление сумм
               rX2 = sum(r_row ** 2)
               rX  = sum(r_row)
               YrX = sum(matrix(:, 2) * r_row)
               Y   = sum(matrix(:, 2))

               ! Вычисление коэффициента a
               a = ( YrX * N_RP - Y * rX ) / ( rX2 * N_RP - rX * rX )

               ! Вычисление коэффициента b
               b = ( Y - a * rX ) / N_RP

               ! Вычисление погрешности метода
               err = sum( (matrix(:, 2) - a * r_row - b) ** 2 )

               ! Запись результата в объект
               call result%put_ls_ftype('hyperbolic')
               call result%put_coefs([a, b])
               call result%put_err(err)
               
               ! Освобождение памяти из-под r_row
               deallocate(r_row, stat = stat)
               if ( stat .ne. 0_SP ) call log_lsm_error('WD_r_row')

          end associate
          
     end procedure lsm_hyperbolic
     
end submodule lsm_hyperbolic_s