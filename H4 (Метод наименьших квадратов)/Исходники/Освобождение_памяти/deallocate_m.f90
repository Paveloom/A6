module deallocate_m
use input_m, only : input_type, & ! Тип, определяющий входные данные
                  & deallocate_input ! Процедура для освобождения памяти из-под матрицы входных данных
implicit none
     
     private
     public :: deallocate
     
     interface deallocate
     
          module procedure deallocate_input
     
     end interface deallocate
     
end module deallocate_m