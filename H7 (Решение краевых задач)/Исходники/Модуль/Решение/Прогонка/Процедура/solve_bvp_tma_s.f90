submodule ( solve_bvp_tma_m ) solve_bvp_tma_s
implicit none
     
     contains
     
     ! Процедура метода прогонки
     module procedure solve_bvp_tma
          
          real(RP), allocatable, dimension(:) :: alpha ! Массив коэффициентов alpha
          real(RP), allocatable, dimension(:) :: beta ! Массив коэффициентов beta

          real(RP) a, b, c, d, e ! Вспомогательные коэффициенты

          real(RP), pointer, dimension(:) :: x_pt ! Указатель на массив узловых точек
          real(RP), pointer, dimension(:) :: y_pt ! Указатель на массив значений искомой функции
          real(RP), pointer, dimension(:) :: z_pt ! Указатель на массив значений производной искомой функции

          real(RP), pointer :: l_pt ! Указатель на начало промежутка
          real(RP), pointer :: r_pt ! Указатель на конец промежутка

          real(RP) :: h ! Шаг
          real(RP) :: hh ! Квадрат шага

          integer(IP), pointer :: n_pt ! Указатель на число разбиений промежутка
          integer(JP) :: nm1 ! Число разбиений промежутка - 1 (счетчик)

          integer(SP) :: stat ! Статусная переменная

          real(RP) :: x ! Текущее значение x
          real(RP) :: pxh ! Значение p(x) * h / 2

          real(RP) :: k_RP ! Овеществление k
          integer(JP) :: k, km1 ! Вспомогательные переменные

          ! Получение числа разбиений промежутка
          n_pt => input%get_n_pt()

          ! Получение значения n - 1
          nm1 = int(n_pt, kind = JP) - 1_JP

          ! Получение значений начала и конца промежутка
          
          l_pt => input%get_l_pt()
          r_pt => input%get_r_pt()

          ! Получение указателей на массивы

          x_pt => result%get_x_pt()
          y_pt => result%get_y_pt()
          z_pt => result%get_z_pt()

          ! Вычисление шага
          h = (r_pt - l_pt) / real(n_pt, kind = RP)

          ! Вычисление квадрата шага
          hh = h * h

          ! Выделение памяти под массивы коэффициентов

          allocate( alpha(0:nm1), stat = stat ) ! Выделение памяти под массив alpha
          if ( stat .ne. 0_SP ) call log_bvp_error('WA_alpha') ! Проверка на ошибку выделения памяти

          allocate( beta(0:nm1), stat = stat ) ! Выделение памяти под массив beta
          if ( stat .ne. 0_SP ) call log_bvp_error('WA_beta') ! Проверка на ошибку выделения памяти

          ! [ Прямой ход ]

          ! Вычисление первых коэффициентов
          
          x_pt(0) = l_pt

          b = input%get_beta_1_pt() * h + input%get_alpha_1_pt()
          c = - input%get_alpha_1_pt()
          d = input%get_gamma_1_pt() * h

          alpha(0) = d / b
          beta(0) = - c / b

          ! Вычисление коэффициентов при k от единицы до n - 1
          
          do k = 1_JP, nm1

               k_RP = real(k, kind = RP)
               km1 = k - 1_JP
               
               x = l_pt + k_RP * h
               x_pt(k) = x

               pxh = p(x) * h / 2._RP

               a = 1._RP - pxh
               b = q(x) * hh - 2._RP
               c = 1._RP + pxh
               d = - f(x) * hh

               e = a * beta(km1) + b

               alpha(k) = (d - a * alpha(km1)) / e
               beta(k) = - c / e

          enddo

          ! Вычисление последних коэффициентов

          x_pt(n_pt) = r_pt
          
          a = - input%get_alpha_2_pt()
          b = input%get_beta_2_pt() * h + input%get_alpha_2_pt()
          d = input%get_gamma_2_pt() * h

          ! [ Обратный ход ]

          ! Вычисление y(n)
          y_pt(n_pt) = (d - a * alpha(nm1)) / (a * beta(nm1) + b)

          ! Вычисление значений y от n - 1 до единицы
          
          do k = nm1, 0_JP, -1_JP

               y_pt(k) = alpha(k) + beta(k) * y_pt(k + 1_JP)

          enddo

          ! Освобождение памяти из-под массивов коэффициентов

          deallocate( alpha, stat = stat )
          if ( stat .ne. 0_SP ) call log_bvp_error('WD_alpha')

          deallocate( beta, stat = stat )
          if ( stat .ne. 0_SP ) call log_bvp_error('WD_beta')
          
     end procedure solve_bvp_tma
     
end submodule solve_bvp_tma_s