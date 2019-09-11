module subprograms
use integrand
implicit none
     
     contains

     subroutine gauss_quad_init(n, a, b, t, w)
     implicit none
          
          integer(4), intent(in) :: n ! Число узлов (степень полинома Лежандра)
          real(8), intent(in) :: a, b ! Границы промежутка

          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(inout), dimension(n) :: t, w

          ! Вспомогательные переменные
          logical(1) :: a_isCloseToOne, b_isCloseToOne
          real(8) :: ba_half_diff

          if ( abs( a - b ) .lt. 1e-5 ) then

               stop 'Границы промежутка либо совпадают, либо слишком близки.'

          else

               a_isCloseToOne = ( a - 1d0 ) .lt. 1e-5
               b_isCloseToOne = ( b - 1d0 ) .lt. 1e-5

               if ( a_isCloseToOne .and. b_isCloseToOne ) then
                    
                    write(*,*) gauss_quad_unit(t, w)

               else

                    ba_half_diff = ( b - a ) / 2d0
                    
                    w = ba_half_diff * w
                    t = ba_half_diff * t + ( b + a ) / 2d0
                    
                    write(*,*) gauss_quad_unit(t, w)

               endif

          endif

     end subroutine gauss_quad_init

     function gauss_quad_unit(t, w) result(int)
     implicit none
          
          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(in), dimension(:) :: t, w

          real(8) :: int ! Результат интегрирования

          int = sum( f(t) * w )

     end function gauss_quad_unit
     

end module subprograms