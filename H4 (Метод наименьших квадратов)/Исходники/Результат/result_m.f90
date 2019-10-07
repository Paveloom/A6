module result_m ! Модуль, отвечающий за процедуры, связанные с результатом
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & SP    ! Точность целого числа статусной переменной
use result_warns_m, only : log_result_error ! Процедура для вывода ошибок для модулей,
                                            ! связанных с результатом
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий результат
             & deallocate_result ! Процедура для освобождения памяти из-под результата

     ! Тип, определяющий результат
     type result_type

          ! private

          character(:), allocatable :: ls_ftype ! Тип функции для использования МНК
          real(RP), allocatable, dimension(:) :: coefs ! Массив коэффициентов
          real(RP) :: err ! Погрешность аппроксимирующей функции

     end type result_type

     interface

          module impure elemental subroutine deallocate_result(result)
          implicit none

               type ( result_type ), intent(inout) :: result ! Результат

          end subroutine deallocate_result

     end interface
     
end module result_m