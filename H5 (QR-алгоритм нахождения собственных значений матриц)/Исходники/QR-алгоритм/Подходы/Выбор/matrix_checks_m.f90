module matrix_checks_m ! Модуль, содержащий функции для 
                       ! осуществления проверок, является ли матрица вещественной или
                       ! является ли матрица эрмитовой
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & JP, & ! Точность целого числа счетчика
                 & LP    ! Число байт для хранения логической переменной
use input_m, only : input_type ! Тип, определяющий входные данные 
implicit none
     
     private
     public :: matrix_is_purely_real, & ! Функция для проверки, является ли матрица вещественной
             & matrix_is_hermitian ! Функция для проверки, является ли матрица эрмитовой
     
     interface
     
          ! Функция для проверки, является ли матрица вещественной
          module function matrix_is_purely_real(input) result(is_it)
          implicit none
          
               type ( input_type ), intent(in) :: input ! Входные данные
               logical(LP) :: is_it ! Является ли матрица вещественной?
          
          end function matrix_is_purely_real

          ! Функция для проверки, является ли матрица эрмитовой
          module function matrix_is_hermitian(input) result(is_it)
          implicit none
          
               type ( input_type ), intent(in) :: input ! Входные данные
               logical(LP) :: is_it ! Является ли матрица эрмитовой?
          
          end function matrix_is_hermitian
     
     end interface
     
end module matrix_checks_m