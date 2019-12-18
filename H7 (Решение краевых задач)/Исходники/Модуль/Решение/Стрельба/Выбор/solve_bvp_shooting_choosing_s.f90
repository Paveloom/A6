submodule ( solve_bvp_shooting_m ) solve_bvp_shooting_choosing_s
implicit none
     
     contains
     
     ! Процедура для выбора и вызова необходимой варьирующей процедуры
     module procedure solve_bvp_shooting_choosing

          ! Показывать вывод на итерациях метода стрельбы?
          if ( settings%get_do_show_shooting_output() ) then
               
               select case (LT)

               ! Левая граница: условие первого рода
               case ( 1_IP )

                    select case (RT)

                    ! Правая граница: условие первого рода
                    case ( 1_IP )

                         call solve_bvp_shooting_with_LB1_and_RB1_loud(input, result)

                    ! Правая граница: условие второго рода
                    case ( 2_IP )

                         !call solve_bvp_shooting_with_LB1_and_RB2_loud(input, result)

                    ! Правая граница: условие третьего рода
                    case default

                         !call solve_bvp_shooting_with_LB1_and_RB3_loud(input, result)

                    end select

               ! Левая граница: условие второго рода
               case ( 2_IP )

                    select case (RT)

                    ! Правая граница: условие первого рода
                    case ( 1_IP )

                         !call solve_bvp_shooting_with_LB2_and_RB1_loud(input, result)

                    ! Правая граница: условие второго рода
                    case ( 2_IP )

                         !call solve_bvp_shooting_with_LB2_and_RB2_loud(input, result)

                    ! Правая граница: условие третьего рода
                    case default

                         !call solve_bvp_shooting_with_LB2_and_RB3_loud(input, result)

                    end select

               ! Левая граница: условие третьего рода
               case default

                    select case (RT)

                    ! Правая граница: условие первого рода
                    case ( 1_IP )

                         !call solve_bvp_shooting_with_LB3_and_RB1_loud(input, result)

                    ! Правая граница: условие второго рода
                    case ( 2_IP )

                         !call solve_bvp_shooting_with_LB3_and_RB2_loud(input, result)

                    ! Правая граница: условие третьего рода
                    case default

                         !call solve_bvp_shooting_with_LB3_and_RB3_loud(input, result)

                    end select

               end select

          else

               select case (LT)

               ! Левая граница: условие первого рода
               case ( 1_IP )
     
                    select case (RT)

                    ! Правая граница: условие первого рода
                    case ( 1_IP )

                         !call solve_bvp_shooting_with_LB1_and_RB1_quiet(input, result)

                    ! Правая граница: условие второго рода
                    case ( 2_IP )

                         !call solve_bvp_shooting_with_LB1_and_RB2_quiet(input, result)

                    ! Правая граница: условие третьего рода
                    case default

                         !call solve_bvp_shooting_with_LB1_and_RB3_quiet(input, result)

                    end select

               ! Левая граница: условие второго рода
               case ( 2_IP )

                    select case (RT)

                    ! Правая граница: условие первого рода
                    case ( 1_IP )

                         !call solve_bvp_shooting_with_LB2_and_RB1_quiet(input, result)

                    ! Правая граница: условие второго рода
                    case ( 2_IP )

                         !call solve_bvp_shooting_with_LB2_and_RB2_quiet(input, result)

                    ! Правая граница: условие третьего рода
                    case default

                         !call solve_bvp_shooting_with_LB2_and_RB3_quiet(input, result)

                    end select

               ! Левая граница: условие третьего рода
               case default

                    select case (RT)

                    ! Правая граница: условие первого рода
                    case ( 1_IP )

                         !call solve_bvp_shooting_with_LB3_and_RB1_quiet(input, result)

                    ! Правая граница: условие второго рода
                    case ( 2_IP )

                         !call solve_bvp_shooting_with_LB3_and_RB2_quiet(input, result)

                    ! Правая граница: условие третьего рода
                    case default

                         !call solve_bvp_shooting_with_LB3_and_RB3_quiet(input, result)

                    end select

               end select
                    
          endif
          
     end procedure solve_bvp_shooting_choosing
     
end submodule solve_bvp_shooting_choosing_s