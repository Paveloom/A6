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

          complex(CP), allocatable, dimension(:) :: evalues ! Массив собственных чисел матрицы

     end type result_type

     interface
     
          ! Процедура для освобождения памяти из-под результата
          module impure elemental subroutine deallocate_result(result)
          implicit none
          
          type ( result_type ), intent(inout) :: result
          
          end subroutine deallocate_result
     
     end interface
     
end module result_m