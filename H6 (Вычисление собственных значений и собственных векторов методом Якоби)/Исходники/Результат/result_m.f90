module result_m ! Модуль, содержащий тип результата и процедуры,
                ! связанные с объектами этого типа
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & JP, & ! Точность целого числа счетчика
                 & SP, & ! Точность целого числа статусной переменной
                 & FP    ! Число байт для хранения вспомогательной строки
use result_warns_m, only : log_result_error ! Процедура для вывода ошибок для других процедур, 
                                            ! связанных с результатом
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий результат
             & deallocate_result, & ! Процедура для освобождения памяти из-под результата
             & write ! Процедура для вывода результата
     
     type result_type

          private

          real(RP), allocatable, dimension(:) :: evalues ! Массив собственных чисел матрицы
          real(RP), allocatable, dimension(:, :) :: evectors ! Матрица собственных векторов

          contains

          procedure :: put_evalues ! Процедура для присваивания значений массиву
                                   ! собственных чисел результата
          procedure :: put_evectors ! Процедура для присваивания значений матрице
                                    ! собственных векторов результата

     end type result_type

     interface
     
          ! Процедура для присваивания значений массиву
          ! собственных чисел результата
          module pure subroutine put_evalues(result, evalues)
          implicit none
          
               real(RP), dimension(:), contiguous, intent(in) :: evalues ! Массив собственных чисел
               class ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine put_evalues

          ! Процедура для присваивания значений матрице
          ! собственных векторов результата
          module pure subroutine put_evectors(result, evectors)
          implicit none
               
               real(RP), dimension(:, :), contiguous, intent(in) :: evectors ! Матрица собственных векторов
               class ( result_type ), intent(inout) :: result ! Результат
               
          end subroutine put_evectors

          ! Процедура для вывода результата
          module impure elemental subroutine write(result)

               type ( result_type ), intent(in) :: result ! Результат

          end subroutine
     
          ! Процедура для освобождения памяти из-под результата
          module impure elemental subroutine deallocate_result(result)
          implicit none
          
               type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine deallocate_result

     end interface
     
end module result_m