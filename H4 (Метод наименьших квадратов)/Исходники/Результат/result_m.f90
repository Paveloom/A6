module result_m ! Модуль, отвечающий за процедуры, связанные с результатом
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & RF    ! Формат вывода вещественных чисел
use result_warns_m, only : log_result_error ! Процедура для вывода ошибок для модулей,
                                            ! связанных с результатом
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий результат
             & deallocate_result, & ! Процедура для освобождения памяти из-под результата
             & write ! Процедура для вывода результата 

     ! Тип, определяющий результат
     type result_type

          private

          character(:), allocatable :: ls_ftype ! Тип функции для использования МНК
          real(RP), allocatable, dimension(:) :: coefs ! Массив коэффициентов
          real(RP) :: err ! Погрешность аппроксимирующей функции
          real(RP), allocatable, dimension(:) :: err_array ! Погрешности аппроксимирующих функций (массив)
          character(:), allocatable :: file ! Имя файла, откуда были считаны данные

          contains

          procedure :: put_ls_ftype ! Процедура для присваивания значения переменной ls_ftype
          procedure :: put_coefs ! Процедура для присваивания значения массиву coefs
          procedure :: put_err => put_err_scalar ! Процедура для присваивания значения переменной err
          procedure :: put_err_array ! Процедура для присваивания значений массиву err
          procedure :: put_file ! Процедура для присваивания значения переменной file

     end type result_type

     interface

          ! Процедура для присваивания значения переменной ls_ftype
          module subroutine put_ls_ftype(result, ls_ftype)
          implicit none

               class ( result_type ), intent(inout) :: result ! Результат
               character(*), intent(in) :: ls_ftype ! Тип функции для использования МНК

          end subroutine put_ls_ftype

          ! Процедура для присваивания значения массиву coefs
          module subroutine put_coefs(result, coefs)
          implicit none

               class ( result_type ), intent(inout) :: result ! Результат
               real(RP), dimension(:), contiguous, intent(in) :: coefs ! Массив коэффициентов

          end subroutine put_coefs

          ! Процедура для присваивания значения переменной err
          module subroutine put_err_scalar(result, err)
          implicit none
     
               class ( result_type ), intent(inout) :: result ! Результат
               real(RP), intent(in) :: err ! Погрешность метода
     
          end subroutine put_err_scalar

          ! Процедура для присваивания значений массиву err
          module subroutine put_err_array(result, err_array)
               implicit none
          
                    class ( result_type ), intent(inout) :: result  ! Результат
                    real(RP), dimension(:), intent(in) :: err_array ! Погрешность метода
          
               end subroutine put_err_array

          ! Процедура для присваивания значения переменной file
          module subroutine put_file(result, file)
          implicit none
          
               class ( result_type ), intent(inout) :: result ! Результат
               character(*), intent(in) :: file ! Имя файла, откуда были считаны данные
          
          end subroutine put_file

          ! Процедура для вывода результата
          module impure elemental subroutine write(result)
          implicit none
               
               type ( result_type ), intent(in) :: result ! Результат
               
          end subroutine write

          ! Процедура для освобождения памяти из-под результата
          module impure elemental subroutine deallocate_result(result)
          implicit none

               type ( result_type ), intent(inout) :: result ! Результат

          end subroutine deallocate_result

     end interface
     
end module result_m