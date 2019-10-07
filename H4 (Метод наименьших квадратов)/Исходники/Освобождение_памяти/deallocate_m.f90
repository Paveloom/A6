module deallocate_m ! Модуль с родовой процедурой для освобождения данных из-под входных данных и результата
use input_m, only : input_type, & ! Тип, определяющий входные данные
                  & deallocate_input ! Процедура для освобождения памяти из-под входных данных
use result_m, only : result_type, & ! Тип, определяющий результат
                   & deallocate_result ! Процедура для освобождения памяти из-под результата
implicit none
     
     private
     public :: deallocate
     
     ! Родовая процедура для освобождения данных из-под входных данных и результатов
     interface deallocate
     
          module procedure deallocate_input, deallocate_result, deallocate_both
     
     end interface deallocate

     interface

          ! Процедура для освобождения данных из-под входных данных и результатов
          module impure elemental subroutine deallocate_both(input, result)
          implicit none

               type ( input_type ), intent(inout) :: input
               type ( result_type ), intent(inout) :: result

          end subroutine deallocate_both

     end interface
     
end module deallocate_m