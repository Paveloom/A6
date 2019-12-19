submodule ( solve_bvp_shooting_m ) solve_bvp_shooting_LB2_and_RB3_quiet_s
implicit none
     
     contains
     
     ! Процедура для получение решения краевой задачи
     ! при граничном условии второго рода на левой границе
     ! и при граничном условии третьего рода на правой границе
     ! (без дополнительного вывода)
     module procedure solve_bvp_shooting_LB2_and_RB3_quiet
          
          real(RP), pointer, dimension(:) :: x_pt ! Указатель на массив узловых точек
          real(RP), pointer, dimension(:) :: y_pt ! Указатель на массив значений искомой функции
          real(RP), pointer, dimension(:) :: z_pt ! Указатель на массив значений производной искомой функции

          real(RP) :: y_l_1 ! Первое начальное значение y(l)
          real(RP) :: y_l_2 ! Второе начальное значение y(l)
          real(RP) :: y_l_3 ! Третье начальное значение y(l)

          real(RP) :: y_r_1 ! Значение y(r) при первом начальном значении y(l)
          real(RP) :: y_r_2 ! Значение y(r) при втором начальном значении y(l)
          real(RP) :: z_r_1 ! Значение z(r) при первом начальном значении y(l)
          real(RP) :: z_r_2 ! Значение z(r) при втором начальном значении y(l)

          ! Погрешности
          real(RP) :: eps_1, eps_2

          integer(IP), pointer :: n_pt ! Указатель на число разбиений промежутка

          ! Получение указателя на число разбиений промежутка
          n_pt => input%get_n_pt()

          ! Получение указателей на массивы

          x_pt => result%get_x_pt()
          y_pt => result%get_y_pt()
          z_pt => result%get_z_pt()

          ! Заполнение начальных данных

          x_pt(0) = input%get_l()
          z_pt(0) = - input%get_gamma_1_pt() / input%get_alpha_1_pt()

          ! Получение начальных значений для y(l)

          y_l_1 = settings%get_y_l_initial_1()
          y_l_2 = settings%get_y_l_initial_2()

          ! Присваивание первого начального значения y(l)

          y_pt(0) = y_l_1

          ! Интегрирование задачи Коши методом Рунге-Кутта

          call runge_kutta(input, result)

          ! Запись полученных y(r) и z(r)

          y_r_1 = y_pt(n_pt)
          z_r_1 = z_pt(n_pt)

          ! Присваивание второго начального значения y(l)

          y_pt(0) = y_l_2

          ! Интегрирование задачи Коши методом Рунге-Кутта

          call runge_kutta(input, result)

          ! Запись полученных y(r) и z(r)

          y_r_2 = y_pt(n_pt)
          z_r_2 = z_pt(n_pt)

          ! Вычисление погрешностей
          
          eps_1 = input%get_alpha_2_pt() * z_r_1 + input%get_beta_2_pt() * y_r_1 - input%get_gamma_2_pt()
          eps_2 = input%get_alpha_2_pt() * z_r_2 + input%get_beta_2_pt() * y_r_2 - input%get_gamma_2_pt()

          ! Использование метода секущих для
          ! определения более точного параметра

          y_l_3 = y_l_2 - ( y_l_2 - y_l_1 ) / ( eps_2 - eps_1 ) * eps_2

          ! Присваивание третьего начального значения y(l)

          y_pt(0) = y_l_3

          ! Интегрирование задачи Коши методом Рунге-Кутта

          call runge_kutta(input, result)

     end procedure solve_bvp_shooting_LB2_and_RB3_quiet
     
end submodule solve_bvp_shooting_LB2_and_RB3_quiet_s