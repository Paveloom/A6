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
     call input%put_r(4._RP * datan(1._RP))
     call input%put_gamma_2(- 1._RP / 5._RP + dexp(input%get_r_pt()) - 6._RP / 5._RP * dexp(2._RP * input%get_r_pt()))

     ! Выделение памяти под результат
     call allocate_result(input, result)

     ! Решение краевой задачи
     call solve_bvp(input, settings, result)

     ! Вывод результата
     call write(result)

     ! Освобождение памяти из-под результата
     call deallocate(result)

end program main

! Автор: Павел Соболев (http://paveloom.tk)
