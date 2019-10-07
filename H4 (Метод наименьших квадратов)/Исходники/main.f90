program main
use input_m, only : input_type, & ! Тип, определяющий входные данные
                  & read ! Процедура для выделения памяти / считывания начальных данных
use result_m, only : result_type ! Тип, определяющий результат
use deallocate_m, only : deallocate ! Процедура для освобождения памяти из-под данных объектов
implicit none
     
     type ( input_type ) input ! Входные данные
     type ( result_type ) result ! Результат

     call read(input, file = 'input') ! Выделение памяти / считывание входных данных

     result = result_type('oof', [12.d0, 2.d0], 15.d0)

     call deallocate(input, result) ! Освобождение памяти из-под данных объектов

end program main