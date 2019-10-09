submodule ( lsm_m ) lsm_linear_s ! Подмодуль, содержащий процедуру для вызова метода
                                 ! наименьших квадратов для линейной функции
implicit none
     
     contains
     
     ! Процедура для вызова метода наименьших квадратов для линейной функции
     module procedure lsm_linear
          
          real(RP) :: a, b ! Коэффициенты
          real(RP) :: err  ! Погрешность метода

          real(RP) :: X  ! Сумма x_i-ых
          real(RP) :: X2 ! Сумма x^2_i-ых
          real(RP) :: Y  ! Сумма y_i-ых
          real(RP) :: XY ! Сумма (x_i * y_i)-ых

          integer(IP) :: N ! Длина матрицы входных данных
          real(RP) :: N_RP ! Овеществление N

          associate (matrix => input%matrix)

               ! Вычисление длины матрицы входных данных
               N = size(matrix(:, 1))

               ! Овеществление N
               N_RP = real(N, kind = RP)
               
               ! Вычисление сумм
               X = sum(matrix(:, 1))
               X2 = sum(matrix(:, 1) ** 2)
               Y = sum(matrix(:, 2))
               XY = sum(matrix(:, 1) * matrix(:, 2))

               ! Вычисление коэффициента a
               a = ( XY * N_RP - Y * X ) / ( X2 * N_RP - X * X )

               ! Вычисление коэффициента b
               b = ( Y - a * X ) / N_RP

               ! Вычисление погрешности метода
               err = sum( (matrix(:, 2) - a * matrix(:, 1) - b) ** 2 )

               ! Запись результата в объект
               call result%put_ls_ftype('linear')
               call result%put_coefs([a, b])
               call result%put_err(err)

          end associate
          
     end procedure lsm_linear
     
end submodule lsm_linear_s