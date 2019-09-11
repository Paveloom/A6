module integrand
implicit none
     
     interface f
     module procedure f_scalar, f_array
     end interface f

     contains
     
     function f_scalar(x)
     implicit none
          
          real(8), intent(in) :: x
          real(8) :: f_scalar

          f_scalar = (x + 1d0) * dsin(x)

     end function f_scalar

     function f_array(x)
     implicit none
          
          real(8), intent(in), dimension(:) :: x
          real(8), dimension(size(x)) :: f_array

          integer(4) :: i ! Вспомогательная переменная

          do i = 1, size(x)

               f_array(i) = f_scalar(x(i))

          enddo
          
     end function f_array
     
end module integrand