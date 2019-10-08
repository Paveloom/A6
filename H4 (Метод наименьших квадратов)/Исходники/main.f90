program main ! Программа для использования метода наименьших квадратов
use input_m, only : input_type, & ! Тип, определяющий входные данные
                  & read ! Процедура для выделения памяти / считывания начальных данных
use lsm_m, only : lsm ! Процедура для общего вызова метода наименьших квадратов
use result_m, only : result_type ! Тип, определяющий результат
use deallocate_m, only : deallocate ! Процедура для освобождения памяти из-под данных объектов
implicit none
     
     type ( input_type ) input ! Входные данные
     type ( result_type ) result ! Результат

     call read(input, file = 'input') ! Выделение памяти / считывание входных данных

     call lsm(input, result) ! Вызов метода наименьших квадратов

     call deallocate(input, result) ! Освобождение памяти из-под данных объектов

end program main