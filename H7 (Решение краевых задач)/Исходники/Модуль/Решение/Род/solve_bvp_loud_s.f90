submodule ( bvp_solver_m ) solve_bvp_loud_s
implicit none
     
     contains
     
     ! Процедура общего вызова для получения решения
     ! (с дополнительным выводом)
     module procedure solve_bvp_loud
          
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
          alpha_1_is_near_zero = abs(input%get_alpha_1_pt()) .lt. input_params_err_pt
          beta_1_is_near_zero  = abs(input%get_beta_1_pt()) .lt. input_params_err_pt
          alpha_2_is_near_zero = abs(input%get_alpha_2_pt()) .lt. input_params_err_pt
          beta_2_is_near_zero  = abs(input%get_beta_2_pt()) .lt. input_params_err_pt

          ! Проверка, близки ли параметры alpha_1 и beta_1 к нулю
          if ( alpha_1_is_near_zero .and. beta_1_is_near_zero ) call log_bvp_error("WBL")

          ! Проверка, близки ли параметры alpha_2 и beta_2 к нулю
          if ( alpha_2_is_near_zero .and. beta_2_is_near_zero ) call log_bvp_error("WBR")

          ! Выбор метода для решения задачи

          if ( settings%get_method_number() .eq. 1 ) then ! Метод стрельбы

               write(*,'(/, 5x, a, /)') 'Определение родов граничных условий:'

               ! Определение типа граничного условия на левой границе

               if ( .not. alpha_1_is_near_zero .and. .not. beta_1_is_near_zero ) then
                    
                    ! Граничное условие третьего рода
                    LT = 3_IP

                    ! Вывод информации
                    write(*,'(5x, a)') 'Обнаружено граничное условие третьего рода на левой границе промежутка.'

               elseif ( beta_1_is_near_zero ) then
                    
                    ! Граничное условие второго рода
                    LT = 2_IP

                    ! Вывод информации
                    write(*,'(5x, a)') 'Обнаружено граничное условие второго рода на левой границе промежутка.'

               else
                    
                    ! Граничное условие первого рода
                    LT = 1_IP

                    ! Вывод информации
                    write(*,'(5x, a)') 'Обнаружено граничное условие первого рода на левой границе промежутка.'
                    
               endif

               ! Определение типа граничного условия на правой границе

               if ( .not. alpha_2_is_near_zero .and. .not. beta_2_is_near_zero ) then
                    
                    ! Граничное условие третьего рода
                    RT = 3_IP

                    ! Вывод информации
                    write(*,'(5x, a, /)') 'Обнаружено граничное условие третьего рода на правой границе промежутка.'

               elseif ( beta_2_is_near_zero ) then
                    
                    ! Граничное условие второго рода
                    RT = 2_IP

                    ! Вывод информации
                    write(*,'(5x, a, /)') 'Обнаружено граничное условие второго рода на правой границе промежутка.'

               else
                    
                    ! Граничное условие первого рода
                    RT = 1_IP

                    ! Вывод информации
                    write(*,'(5x, a, /)') 'Обнаружено граничное условие первого рода на правой границе промежутка.'
                    
               endif

               ! Выбор и вызов необходимой варьирующей процедуры
               call solve_bvp_shooting_choosing(input, settings, LT, RT, result)

               ! Присвоение номера метода результату
               call result%put_method_number_result(1_IP)

          elseif ( settings%get_method_number() .eq. 2 ) then ! Метод прогонки

               ! Вызов процедуры метода прогонки
               call solve_bvp_tma(input, settings, result)

               ! Присвоение номера метода результату
               call result%put_method_number_result(2_IP)

          else

               write(*,'(/, 5x, a, /)') 'Неизвестный номер метода. Проверьте правильность введенных данных в файле настроек.'

               stop

          endif
          
     end procedure solve_bvp_loud
     
end submodule solve_bvp_loud_s