module integrand
implicit none
     
     contains
     
     function f(x)
     implicit none
          
          real(8), intent(in) :: x
          real(8) :: f

          f = (x + 1d0) * dsin(x)

     end function f
     
end module integrand