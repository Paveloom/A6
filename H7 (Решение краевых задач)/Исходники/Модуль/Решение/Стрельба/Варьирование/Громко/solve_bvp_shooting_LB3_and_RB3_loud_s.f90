submodule ( solve_bvp_shooting_m ) solve_bvp_shooting_LB3_and_RB3_loud_s
implicit none
     
     contains
     
     ! Процедура для получение решения краевой задачи
     ! при граничном условии третьего рода на левой границе
     ! и при граничном условии третьего рода на правой границе
     ! (с дополнительным выводом)
     module procedure solve_bvp_shooting_LB3_and_RB3_loud
          
          real(RP), pointer, dimension(:) :: x_pt ! Указатель на массив узловых точек
          real(RP), pointer, dimension(:) :: y_pt ! Указатель на массив значений искомой функции
          real(RP), pointer, dimension(:) :: z_pt ! Указатель на массив значений производной искомой функции

          real(RP) :: z_l_1 ! Первое начальное значение z(l)
          real(RP) :: z_l_2 ! Второе начальное значение z(l)
          real(RP) :: z_l_3 ! Третье начальное значение z(l)

          real(RP) :: y_r_1 ! Значение y(r) при первом начальном значении y(l)
          real(RP) :: y_r_2 ! Значение y(r) при втором начальном значении y(l)
          real(RP) :: z_r_1 ! Значение z(r) при первом начальном значении y(l)
          real(RP) :: z_r_2 ! Значение z(r) при втором начальном значении y(l)

          ! Погрешности
          real(RP) :: eps_1, eps_2

          integer(IP), pointer :: n_pt ! Указатель на число разбиений промежутка

          ! Вывод информации о начале работы процедуры
          write(*,'(/, 5x, a, /)') 'Подбор параметра для начального значения y(l):'

          ! Получение указателя на число разбиений промежутка
          n_pt => input%get_n_pt()

          ! Получение указателей на массивы

          x_pt => result%get_x_pt()
          y_pt => result%get_y_pt()
          z_pt => result%get_z_pt()

          ! Заполнение начальных данных
          x_pt(0) = input%get_l()

          ! Получение начальных значений для z(l)

          z_l_1 = settings%get_z_l_initial_1()
          z_l_2 = settings%get_z_l_initial_2()

          ! Присваивание первой пары начальных значений

          z_pt(0) = z_l_1
          y_pt(0) = (input%get_gamma_1_pt() + input%get_alpha_1_pt() * z_l_1) / input%get_beta_1_pt()

          ! Интегрирование задачи Коши методом Рунге-Кутта

          call runge_kutta(input, result)

          ! Запись полученных y(r) и z(r)

          y_r_1 = y_pt(n_pt)
          z_r_1 = z_pt(n_pt)

          ! Присваивание второй пары начальных значений

          z_pt(0) = z_l_2
          y_pt(0) = (input%get_gamma_1_pt() + input%get_alpha_1_pt() * z_l_2) / input%get_beta_1_pt()

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

          z_l_3 = z_l_2 - ( z_l_2 - z_l_1 ) / ( eps_2 - eps_1 ) * eps_2

          ! Присваивание третьей пары начальных значений

          z_pt(0) = z_l_3
          y_pt(0) = (input%get_gamma_1_pt() + input%get_alpha_1_pt() * z_l_3) / input%get_beta_1_pt()

          ! Интегрирование задачи Коши методом Рунге-Кутта

          call runge_kutta(input, result)

          ! Вывод информации о результате

          write(*,'(5x, a, 13x, '//RF//')') 'Полученное значение y(r):', y_pt(n_pt)
          write(*,'(5x, a, 13x, '//RF//')') 'Полученное значение z(r):', z_pt(n_pt)
          write(*,'(5x, a, 2x, '//RF//')') 'Подобранное значение параметра y(l):', y_pt(0)
          write(*,'(5x, a, 2x, '//RF//', /)') 'Подобранное значение параметра z(l):', z_l_3

     end procedure solve_bvp_shooting_LB3_and_RB3_loud
     
end submodule solve_bvp_shooting_LB3_and_RB3_loud_s