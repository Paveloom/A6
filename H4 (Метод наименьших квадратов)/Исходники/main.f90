program main
use input_m, only : input_type, & ! Тип, определяющий входные данные
                  & read ! Процедура для выделения памяти / считывания начальных данных
use deallocate_m, only : deallocate ! Процедура для освобождения памяти из-под данных объектов
implicit none
     
     type ( input_type ) input ! Входные данные

     call read(input) ! Считывание входных данных

     call deallocate(input) ! Освобождение памяти из-под данных объектов

end program main