program main ! Программа, реализующая метод Якоби для поиска
             ! собственных значений и векторов симметричных матриц
use bvp ! Модуль для решения краевых задач
implicit none
     
     type ( input_type ) :: input ! Входные данные
     type ( settings_type ) :: settings ! Настройки программы
     type ( result_type ) :: result ! Результат

     ! Считывание настроек программы
     call read(settings, file = "settings")
     
     ! Считывание входных данных
     call read(input, settings, file = "input")

     ! Ручное задание некоторых входных данных
     call input%put_r(4.d0 * datan(1.d0))
     call input%put_gamma_2(- 1.d0 / 5.d0 + dexp(input%get_r()) - 6.d0 / 5.d0 * dexp(2.d0 * input%get_r()))

     ! Выделение памяти под результат
     call allocate_result(input, result)

     ! Решение краевой задачи
     call solve_bvp(input, settings, result)

     ! Освобождение памяти из-под результата
     call deallocate(result)

end program main

! Автор: Павел Соболев (http://paveloom.tk)
