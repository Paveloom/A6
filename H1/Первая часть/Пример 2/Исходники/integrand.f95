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

               ! Пример подынтегральной функции, 2
               f(i) = dexp(x(i)) * dcos(x(i))

          enddo
          
     end function f
     
end module integrand