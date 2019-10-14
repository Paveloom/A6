program main ! Программа для нахождения значений собственных
             ! чисел квадратных матриц с помощью QR-алгоритма
             ! Хессенберга с одним сдвигом или с помощью
             ! QR-алгоритма Фрэнсиса с двумя сдвигами
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use read_m, only : read ! Процедура для считывания данных объектов из файлов
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use qr_alg_m, only : get_eigenvalues ! Процедура главного вызова модифицированного QR-алгоритма
                                     ! для нахождения значений собственных чисел квадратных матриц
use deallocate_m, only : deallocate ! Процедура для освобождения памяти из-под данных объектов
implicit none
     
     type ( settings_type ) :: settings ! Настройки программы
     type ( input_type ) :: input ! Входные данные
     type ( result_type ) :: result ! Результат

     call read(settings, file = 'settings') ! Считывание настроек программы

     call read(input, file = 'input') ! Считывание входных данных

     call get_eigenvalues(input, result, settings) ! Получение собственных чисел матрицы

     call deallocate(input) ! Освобождение памяти из-под данных объектов
     
end program main

! Автор: Павел Соболев (http://paveloom.tk)

! Использованная литература:
! Elias Jarlebring — Lecture notes in numerical linear algebra — QR Algorithm
! D. Bindel, J. Demmel, W. Kahan, O. Marques — On computing Givens rotations reliably and efficiently
! Peter Arbenz — Lecture Notes on Solving Large Scale Eigenvalue Problems