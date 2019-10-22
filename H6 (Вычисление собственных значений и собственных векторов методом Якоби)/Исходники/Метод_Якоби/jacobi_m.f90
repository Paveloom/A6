module jacobi_m ! Модуль, содержащий процедуру, реализующую метод Якоби для поиска
                ! собственных значений и векторов симметричных матриц
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & JP    ! Точность целого числа счетчика и индекса
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
implicit none
     
     private
     public :: apply_jacobi ! Процедура, реализующая метод Якоби для поиска
                            ! собственных значений и векторов симметричных матриц
     
     interface
     
          ! Процедура, реализующая метод Якоби для поиска
          ! собственных значений и векторов симметричных матриц
          module impure subroutine apply_jacobi(input, result)
          implicit none
          
               type ( input_type ) :: input ! Входные данные
               type ( result_type ) :: result ! Результат
          
          end subroutine apply_jacobi

          ! Процедура, проверяющая, является ли
          ! матрица на входе симметричной
          module impure subroutine test_if_the_matrix_is_symmetric(input)
          implicit none
               
               type ( input_type ) :: input ! Входные данные
               
          end subroutine test_if_the_matrix_is_symmetric
     
     end interface
     
end module jacobi_m