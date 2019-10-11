module qr_alg_m ! Модуль, содержащий процедуры для нахождения значений собственных
                ! чисел квадратных матриц с помощью модифицированного
                ! QR-алгоритма
use input_m, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: get_eigenvalues ! Процедура главного вызова модифицированного QR-алгоритма
                               ! для нахождения значений собственных чисел квадратных матриц
     
     interface
     
          ! Процедура главного вызова модифицированного QR-алгоритма
          ! для нахождения значений собственных чисел квадратных матриц
          module impure elemental subroutine get_eigenvalues(input)
          implicit none
          
          type ( input_type ), intent(in) :: input
          
          end subroutine get_eigenvalues
     
     end interface
     
end module qr_alg_m