module result_m ! Модуль, содержащий тип результата и процедуры,
                ! связанные с объектами этого типа
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & SP    ! Точность целого числа статусной переменной
use result_warns_m, only : log_result_error ! Процедура для вывода ошибок для других процедур, 
                                            ! связанных с результатом
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий результат
             & deallocate_result ! Процедура для освобождения памяти из-под результата
     
     type result_type

          private

          complex(CP), allocatable, dimension(:) :: evalues ! Массив собственных чисел матрицы

          contains

          procedure :: put_evalues ! Процедура для присваивания значений массиву
                                   ! собственных чисел результата

     end type result_type

     interface
     
          ! Процедура для присваивания значений массиву
          ! собственных чисел результата
          module pure subroutine put_evalues(result, evalues)
          implicit none
          
               complex(CP), dimension(:), contiguous, intent(in) :: evalues ! Массив собственных чисел
               class ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine put_evalues
     
          ! Процедура для освобождения памяти из-под результата
          module impure elemental subroutine deallocate_result(result)
          implicit none
          
               type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine deallocate_result

     end interface
     
end module result_m