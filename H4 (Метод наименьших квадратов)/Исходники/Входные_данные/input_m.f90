module input_m ! Модуль, отвечающий за процедуры, связанные с входными данными
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целых чисел статусных переменных
                 & UP    ! Точность целого числа номера дескриптора файла
use input_warns_m, only : log_input_error ! Процедура для вывода ошибок для модулей,
                                          ! связанных с входными данными
implicit none
     
     private
     public :: input_type, & ! Тип, определяющий входные данные
             & read, & ! Процедура для выделения памяти / считывания начальных данных
             & deallocate_input ! Процедура для освобождения памяти из-под входных данных
     
     ! Тип, определяющий входные данные
     type input_type
          
          private

          character(:), allocatable :: ls_ftype ! Тип функции для использования МНК
          integer(IP) :: N ! Длина матрицы входных данных
          real(RP), allocatable, dimension(:,:) :: matrix ! Матрица входных данных
          
     end type input_type

     interface

          ! Процедура для выделения памяти / считывания начальных данных
          module subroutine read(input, file)
          implicit none
               
               type ( input_type ), intent(out) :: input ! Входные данные
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine read

          ! Процедура для освобождения памяти из-под входных данных
          module impure elemental subroutine deallocate_input(input)
          implicit none

               type ( input_type ), intent(inout) :: input ! Входные данные

          end subroutine deallocate_input
          
     end interface
     
end module input_m