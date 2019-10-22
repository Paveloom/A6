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

     ! Тип, определяющий внедиагональный максимум и его компоненты
     type max_type

          real(RP) :: value   ! Значение
          integer(JP) :: i, j ! Индексы

     end type max_type
     
     interface
     
          ! Процедура, реализующая метод Якоби для поиска
          ! собственных значений и векторов симметричных матриц
          module impure subroutine apply_jacobi(input, result)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine apply_jacobi

          ! Процедура, проверяющая, является ли
          ! матрица на входе симметричной
          module impure subroutine test_if_the_matrix_is_symmetric(N_JP, matrix)
          implicit none
               
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица объекта
               real(RP), dimension(:,:), pointer, intent(in) :: matrix
               
          end subroutine test_if_the_matrix_is_symmetric

          ! Процедура, возвращающая максимум среди внедиагональных
          ! элементов матрицы, а также его индексы
          module pure subroutine get_max(N_JP, matrix, max)
          implicit none
               
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица объекта
               real(RP), dimension(:,:), pointer, intent(in) :: matrix
               
               ! Внедиагональный максимум и его индексы
               type ( max_type ), intent(out) :: max
               
          end subroutine get_max
     
     end interface
     
end module jacobi_m