program main ! Программа, реализующая метод Якоби для поиска
             ! собственных значений и векторов симметричных матриц
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки
use read_m, only : read ! Процедура для считывания данных объектов из файлов
use jacobi_m, only : apply_jacobi ! Процедура, реализующая метод Якоби для поиска
                                  ! собственных значений и векторов симметричных матриц
use deallocate_m, only : deallocate ! Процедура для освобождения данных из-под входных данных и результатов
implicit none
     
     type ( input_type ) :: input ! Входные данные
     type ( result_type ) :: result ! Результат
     type ( settings_type ) :: settings ! Настройки программы

     call read(input, "input") ! Считывание входных данных
     call read(settings, "settings") ! Считывание настроек программы

     call apply_jacobi(input, result, settings) ! Вызов метода Якоби для поиска
                                                ! собственных значений и векторов симметричных матриц

     call deallocate(input, result) ! Освобождение памяти из-под данных объектов

end program main