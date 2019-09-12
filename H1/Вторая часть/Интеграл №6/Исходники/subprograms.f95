module subprograms
use integrand
implicit none
     
     contains

     ! Функция, вычисляющая приближение к интегралу по отрезку [-1, 1]
     function gauss_quad_unit(t, w) result(int)
     implicit none

          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(in), dimension(:) :: t, w

          real(8) :: int ! Результат интегрирования

          int = sum( f(t) * w )

     end function gauss_quad_unit

     ! Процедура для приближенного вычисления интеграла с особенностью с помощью формулы Гаусса
     subroutine gauss_quad_sp_init(n, a, b, t, w, c, eps, d1, d2, int)
     implicit none
          
          integer(4), intent(in) :: n ! Число узлов (степень полинома Лежандра)
          real(8), intent(in) :: a, b ! Границы промежутка

          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(in), dimension(n) :: t, w

          real(8), intent(in) :: c      ! Особая точка (подынтегральная функция обращается в бесконечность)
          real(8), intent(in) :: eps    ! Точность вычисления интеграла с особенностью
          real(8), intent(in) :: d1, d2 ! Малые величины дельта-1 и дельта-2 (см. PDF задания)

          real(8), intent(inout) :: int ! Результат интегрирования

          real(8) :: acc ! Вспомогательная переменная

          if ( ( d1 .gt. ( c - a ) ) .or. ( d2 .gt. ( b - c ) ) ) then
               
               stop 'Либо разница c - d1, либо сумма c + d2 выходит за одну &
               &из границ промежутка.'

          elseif ( a .gt. b) then

               stop 'Левая граница промежутка a должна быть меньше, чем правая.'

          else

               ! Проверка валидности малых величин d1 и d2
               
               call gauss_quad_init(n, c - d1, c + d2, t, w, int)

               if ( abs(int) .ge. eps / 2d0 ) stop 'Для малых величин d1 и d2 &
               &абсолютная оценка интеграла оказалась слишком велика.'

               call gauss_quad_init(n, a, c - d1, t, w, int) ! Вычисление интеграла I_1
               call gauss_quad_init(n, c + d2, b, t, w, acc) ! Вычисление интеграла I_2

               int = int + acc

          endif
          
     end subroutine gauss_quad_sp_init     

     ! Процедура для приближенного вычисления интеграла с помощью формулы Гаусса
     subroutine gauss_quad_init(n, a, b, t, w, int)
     implicit none
          
          integer(4), intent(in) :: n ! Число узлов (степень полинома Лежандра)
          real(8), intent(in) :: a, b ! Границы промежутка

          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(in), dimension(n) :: t, w

          real(8), intent(inout) :: int ! Результат интегрирования

          ! Вспомогательные переменные
          logical(1) :: a_isCloseToMinusOne, b_isCloseToPlusOne
          real(8) :: ba_half_diff

          if ( abs( a - b ) .lt. 1e-9 ) then

               stop 'Границы промежутка одного из интегралов либо совпадают, &
               &либо слишком близки.'

          else

               a_isCloseToMinusOne = ( a + 1d0 ) .lt. 1e-5
               b_isCloseToPlusOne  = ( b - 1d0 ) .lt. 1e-5

               ! Если [a, b] == [-1, 1]
               if ( a_isCloseToMinusOne .and. b_isCloseToPlusOne ) then
                    
                    int = gauss_quad_unit(t, w)

               ! Если [a, b] != [-1, 1]
               else

                    ba_half_diff = ( b - a ) / 2d0
                    
                    int = gauss_quad_unit(ba_half_diff * t + ( b + a ) / 2d0, ba_half_diff * w)

                    ! Эти выражения получаются при переходе от отрезка [a, b] к отрезку [-1, 1]

               endif

          endif

     end subroutine gauss_quad_init

end module subprograms