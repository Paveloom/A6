submodule ( solve_bvp_shooting_m ) solve_bvp_shooting_with_LB1_and_RB1_loud_s
implicit none
     
     contains
     
     ! Процедура для получение решения краевой задачи
     ! при граничном условии первого рода на левой границе
     ! и при граничном условии первого рода на правой границе
     ! (с дополнительным выводом)
     module procedure solve_bvp_shooting_with_LB1_and_RB1_loud
          
          real(RP), pointer, dimension(:) :: x_pt ! Указатель на массив узловых точек
          real(RP), pointer, dimension(:) :: y_pt ! Указатель на массив значений искомой функции
          real(RP), pointer, dimension(:) :: z_pt ! Указатель на массив значений производной искомой функции

          ! Получение указателей на массивы

          x_pt => result%get_x_pt()
          y_pt => result%get_y_pt()
          z_pt => result%get_z_pt()

          ! Заполнение начальных данных (временно без итераций)

          x_pt(1) = input%get_l()
          y_pt(1) = input%get_gamma_1() / input%get_beta_1()
          z_pt(1) = 1.d0
          
     end procedure solve_bvp_shooting_with_LB1_and_RB1_loud
     
end submodule solve_bvp_shooting_with_LB1_and_RB1_loud_s