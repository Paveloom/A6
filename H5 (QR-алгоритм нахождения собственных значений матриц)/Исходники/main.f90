program main ! Программа для нахождения значений собственных
             ! чисел квадратных матриц с помощью модифицированного
             ! QR-алгоритма (приведение к матрице Хессенберга,
             ! использование модифицированного метода Гивенса) 
use input_m, only : input_type, & ! Тип, определяющий входные данные
                  & read ! Процедура для выделения памяти / считывания входных данных
use result_m, only : result_type ! Тип, определяющий результат
use deallocate_m, only : deallocate ! Процедура для освобождения памяти из-под данных объектов
implicit none
     
     type ( input_type ) :: input ! Входные данные
     type ( result_type ) :: result ! Результат

     call read(input, file = 'input') ! Считывание входных данных

     call deallocate(input) ! Освобождение памяти из-под данных объектов
     
end program main