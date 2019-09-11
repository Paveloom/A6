module integrand
implicit none

     contains

     ! Подинтегральное выражение
     function f(x)
     implicit none
          
          real(8), intent(in), dimension(:) :: x
          real(8), dimension(size(x)) :: f

          integer(4) :: i ! Вспомогательная переменная
     
          do i = 1, size(x)

               f(i) = dexp(x(i)) * dcos(x(i))

          enddo
          
     end function f
     
end module integrand