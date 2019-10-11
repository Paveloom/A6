module integrand
implicit none

     contains

     ! Подынтегральное выражение
     function f(x)
     implicit none
          
          real(8), intent(in), dimension(:) :: x ! Вектор узлов
          real(8), dimension(size(x)) :: f       ! Вектор значений функции f в узлах

          integer(4) :: i ! Вспомогательная переменная
     
          do i = 1, size(x)

               ! Интеграл с особенностью, №6
               f(i) = ( dsin( x(i) + 1d0 / 2d0 ) * dsin( x(i) + 1d0 / 2d0 ) - dsin( 1d0 / 2d0 ) * dsin( 1d0 / 2d0 ) ) &
               &/ ( dcos( x(i) + 1d0 / 2d0 ) * dcos( x(i) + 1d0 / 2d0 ) - dcos( 1d0 / 2d0 ) * dcos( 1d0 / 2d0 ) )

          enddo
          
     end function f
     
end module integrand