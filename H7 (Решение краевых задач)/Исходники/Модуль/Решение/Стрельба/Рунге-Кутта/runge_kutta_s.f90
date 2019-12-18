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
          real(RP) :: hh, xph, xphh, &
                    & ypkhh_1, zpkhh_1, &
                    & ypkhh_2, zpkhh_2, &
                    & ypkh, zpkh

          ! Получение числа разбиений промежутка
          n_pt => input%get_n_pt()

          ! Овеществление числа разбиений промежутка
          n_RP = real(n_pt, kind = RP)

          ! Конвертация числа разбиений промежутка в счетчик
          n_JP = int(n_pt, kind = JP)

          ! Вычисление шага
          h = (input%get_r_pt() - input%get_l_pt()) / n_RP

          ! Вычисление половины шага
          hh = h / 2.d0

          ! Получение указателей на массивы

          x_pt => result%get_x_pt()
          y_pt => result%get_y_pt()
          z_pt => result%get_z_pt()

          ! Цикл интегрирования

          do i = 1_JP, n_JP

               ! Вычисление вспомогательных переменных

               im1 = i - 1_JP

               xph = x_pt(im1) + h
               xphh = x_pt(im1) + hh

               ! Вычисление инкремента k1

               k1(1) = y_pt(im1)
               k1(2) = - p(x_pt(im1)) * z_pt(im1) - q(x_pt(im1)) * y_pt(im1) - f(x_pt(im1))

               ! Вычисление вспомогательных переменных

               ypkhh_1 = y_pt(im1) + hh * k1(1)
               zpkhh_1 = z_pt(im1) + hh * k1(2)

               ! Вычисление инкремента k2

               k2(1) = zpkhh_1
               k2(2) = - p(xphh) * zpkhh_1 - q(xphh) * ypkhh_1 - f(xphh)

               ! Вычисление вспомогательных переменных

               ypkhh_2 = y_pt(im1) + hh * k2(1)
               zpkhh_2 = z_pt(im1) + hh * k2(2)

               ! Вычисление инкремента k3

               k3(1) = zpkhh_2
               k3(2) = - p(xphh) * zpkhh_2 - q(xphh) * ypkhh_2 - f(xphh)

               ! Вычисление вспомогательных переменных

               ypkh = y_pt(im1) + h * k3(1)
               zpkh = z_pt(im1) + h * k3(2)

               ! Вычисление инкремента k4

               k4(1) = zpkh
               k4(2) = - p(xph) * zpkh - q(xph) * ypkh - f(xph)

               ! Вычисление приближенных значений функций в текущей точке

               y_pt(i) = y_pt(im1) + h / 6.d0 * ( k1(1) + 2.d0 * k2(1) + 2.d0 * k3(1) + k4(1) )
               z_pt(i) = z_pt(im1) + h / 6.d0 * ( k1(2) + 2.d0 * k2(2) + 2.d0 * k3(2) + k4(2) )

               ! Вычисление значения текущего узла
               x_pt(i) = input%get_l_pt() + h * i

          enddo

          write(*,'(i3, 4x, es25.16, 4x, es25.16, 4x, e25.16, 4x)') (i, x_pt(i), y_pt(i), z_pt(i), i = 0, n_JP)
          
     end procedure runge_kutta
     
end submodule runge_kutta_s