module subprograms
use integrand
implicit none
     
     contains

     subroutine gauss_quad_init(n, a, b, t, w)
     implicit none
          
          integer(4), intent(in) :: n ! Число узлов (степень полинома Лежандра)
          real(8), intent(in) :: a, b ! Границы промежутка

          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(in), dimension(n) :: t, w

          if ( a - b .lt. 1e-5 ) then

               stop 'Границы промежутка либо совпадают, либо слишком близки.'

          else

               if ( ( ( a - 1d0 ) .lt. 1e-5 ) .and. ( ( b + 1d0 ) .lt. 1e-5 ) ) write(*,*) gauss_quad_unit(n, t, w)

          endif

     end subroutine gauss_quad_init

     function gauss_quad_unit(n, t, w) result(int)
     implicit none
          
          integer(4), intent(in) :: n ! Число узлов (степень полинома Лежандра)

          ! Корни многочлена Лежандра степени n и соответствующие им веса
          real(8), intent(in), dimension(n) :: t, w

          real(8) :: int ! Результат интегрирования

          int = sum( f(t) * w )

     end function gauss_quad_unit
     

end module subprograms