program main ! Программа для нахождения значений собственных
             ! чисел квадратных матриц с помощью модифицированного
             ! QR-алгоритма (приведение к матрице Хессенберга,
             ! использование модифицированного метода Гивенса) 
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use qr_alg_m, only : get_eigenvalues ! Процедура главного вызова модифицированного QR-алгоритма
                                     ! для нахождения значений собственных чисел квадратных матриц
use deallocate_m, only : deallocate ! Процедура для освобождения памяти из-под данных объектов
use read_m, only : read ! Процедура для считывания данных объектов из файлов
implicit none
     
     type ( settings_type ) :: settings ! Настройки программы
     type ( input_type ) :: input ! Входные данные
     type ( result_type ) :: result ! Результат

     call read(settings, file = 'settings') ! Считывание настроек программы

     call read(input, file = 'input') ! Считывание входных данных

     call get_eigenvalues(input, result, settings) ! Получение собственных чисел матрицы

     call deallocate(input) ! Освобождение памяти из-под данных объектов
     
end program main