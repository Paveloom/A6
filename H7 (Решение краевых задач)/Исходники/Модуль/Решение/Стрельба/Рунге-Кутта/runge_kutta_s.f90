submodule ( solve_bvp_shooting_m ) runge_kutta_s
implicit none
     
     contains
     
     ! Процедура для интегрирования задачи Коши 
     ! методом Рунге-Кутты четвёртого порядка
     module procedure runge_kutta

          real(RP), pointer, dimension(:) :: x_pt ! Указатель на массив узловых точек
          real(RP), pointer, dimension(:) :: y_pt ! Указатель на массив значений искомой функции
          real(RP), pointer, dimension(:) :: z_pt ! Указатель на массив значений производной искомой функции

          ! Инкременты метода Рунге-Кутты
          real(RP), dimension(2) :: k1, k2, k3, k4

          ! Шаг
          real(RP) :: h

          ! Указатель на число разбиений промежутка
          integer(IP), pointer :: n_pt

          ! Число разбиений промежутка (вещественное)
          real(RP) :: n_RP

          ! Число разбиений промежутка (счетчик)
          integer(JP) :: n_JP

          ! Вспомогательные переменные
          integer(JP) :: i, im1
          real(RP) :: i_RP, hh, &
                    & x_prev, y_prev, z_prev, &
                    & xph, xphh, &
                    & pxphh, qxphh, fxphh, &
                    & ypk_1, zpk_1, &
                    & ypk_2, zpk_2, &
                    & ypk_3, zpk_3

          ! Получение числа разбиений промежутка
          n_pt => input%get_n_pt()

          ! Овеществление числа разбиений промежутка
          n_RP = real(n_pt, kind = RP)

          ! Конвертация числа разбиений промежутка в счетчик
          n_JP = int(n_pt, kind = JP)

          ! Вычисление шага
          h = (input%get_r_pt() - input%get_l_pt()) / n_RP

          ! Вычисление половины шага
          hh = h / 2._RP

          ! Получение указателей на массивы

          x_pt => result%get_x_pt()
          y_pt => result%get_y_pt()
          z_pt => result%get_z_pt()

          ! Цикл интегрирования

          do i = 1_JP, n_JP

               ! Вычисление вспомогательных переменных

               i_RP = real(i, kind = RP)
               im1 = i - 1_JP

               x_prev = x_pt(im1)
               y_prev = y_pt(im1)
               z_prev = z_pt(im1)

               xph = x_prev + h
               xphh = x_prev + hh

               pxphh = p(xphh)
               qxphh = q(xphh)
               fxphh = f(xphh)
 
               ! Вычисление инкремента k1

               k1(1) = h * z_prev
               k1(2) = h * ( - p(x_prev) * z_prev - q(x_prev) * y_prev - f(x_prev) )

               ! Вычисление вспомогательных переменных

               ypk_1 = y_prev + k1(1) / 2._RP
               zpk_1 = z_prev + k1(2) / 2._RP

               ! Вычисление инкремента k2

               k2(1) = h * zpk_1
               k2(2) = h * ( - pxphh * zpk_1 - qxphh * ypk_1 - fxphh )

               ! Вычисление вспомогательных переменных

               ypk_2 = y_prev + k2(1) / 2._RP
               zpk_2 = z_prev + k2(2) / 2._RP

               ! Вычисление инкремента k3

               k3(1) = h * zpk_2
               k3(2) = h * ( - pxphh * zpk_2 - qxphh * ypk_2 - fxphh )

               ! Вычисление вспомогательных переменных

               ypk_3 = y_prev + k3(1)
               zpk_3 = z_prev + k3(2)

               ! Вычисление инкремента k4

               k4(1) = h * zpk_3
               k4(2) = h * ( - p(xph) * zpk_3 - q(xph) * ypk_3 - f(xph) )

               ! Вычисление приближенных значений функций в текущей точке

               y_pt(i) = y_prev + ( k1(1) + 2._RP * k2(1) + 2._RP * k3(1) + k4(1) ) / 6._RP
               z_pt(i) = z_prev + ( k1(2) + 2._RP * k2(2) + 2._RP * k3(2) + k4(2) ) / 6._RP

               ! Вычисление значения текущего узла
               x_pt(i) = input%get_l_pt() + h * i_RP

          enddo

     end procedure runge_kutta
     
end submodule runge_kutta_s