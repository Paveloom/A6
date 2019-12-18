submodule ( bvp_solver_m ) solve_bvp_quiet_s
implicit none
     
     contains
     
     ! Процедура общего вызова для получения решения
     ! (без дополнительного вывода)
     module procedure solve_bvp_quiet
          
          ! Величина малости для параметров alpha_1, beta_1, alpha_2, beta_2
          real(RP), pointer :: input_params_err_pt

          integer(IP) :: LT, & ! Тип граничного условия на левой границе
                       & RT    ! Тип граничного условия на правой границе

          logical(LP) :: alpha_1_is_near_zero, & ! Параметр alpha_1 близок к нулю
                       & beta_1_is_near_zero,  & ! Параметр beta_1 близок к нулю
                       & alpha_2_is_near_zero, & ! Параметр alpha_2 близок к нулю
                       & beta_2_is_near_zero     ! Параметр beta_2 близок к нулю

          ! Получение величины малости для параметров alpha_1, beta_1, alpha_2, beta_2
          input_params_err_pt => settings%get_input_params_err()

          ! Вычисление значений для логических переменных
          alpha_1_is_near_zero = abs(input%get_alpha_1()) .lt. input_params_err_pt
          beta_1_is_near_zero  = abs(input%get_beta_1()) .lt. input_params_err_pt
          alpha_2_is_near_zero = abs(input%get_alpha_2()) .lt. input_params_err_pt
          beta_2_is_near_zero  = abs(input%get_beta_2()) .lt. input_params_err_pt

          ! Проверка, близки ли параметры alpha_1 и beta_1 к нулю
          if ( alpha_1_is_near_zero .and. beta_1_is_near_zero ) call log_bvp_error("WBL")

          ! Проверка, близки ли параметры alpha_2 и beta_2 к нулю
          if ( alpha_2_is_near_zero .and. beta_2_is_near_zero ) call log_bvp_error("WBR")

          ! Определение типа граничного условия на левой границе

          if ( .not. alpha_1_is_near_zero .and. .not. beta_1_is_near_zero ) then
               
               ! Граничное условие третьего рода
               LT = 3_IP

          elseif ( beta_1_is_near_zero ) then
               
               ! Граничное условие второго рода
               LT = 2_IP

          else
               
               ! Граничное условие первого рода
               LT = 1_IP
               
          endif

          ! Определение типа граничного условия на правой границе

          if ( .not. alpha_2_is_near_zero .and. .not. beta_2_is_near_zero ) then
               
               ! Граничное условие третьего рода
               RT = 3_IP

          elseif ( beta_2_is_near_zero ) then
               
               ! Граничное условие второго рода
               RT = 2_IP

          else
               
               ! Граничное условие первого рода
               RT = 1_IP
               
          endif

          ! Выбор и вызов необходимой варьирующей процедуры
          call solve_bvp_shooting_choosing(input, settings, LT, RT, result)
          
     end procedure solve_bvp_quiet
     
end submodule solve_bvp_quiet_s