program main
use input, only : input_type, & ! Тип, определяющий начальные данные
                & read ! Процедура для считывания начальных данных
use result, only : result_type, & ! Тип, определяющий результат
                 & allocate,    & ! Процедура, выделяющая память под результат
                 & deallocate,  & ! Процедура, освобождающая память из-под результата
                 & write          ! Процедура, выводящая результат
use euler, only : solve_euler ! Процедура, решающая дифференциальное уравнение
                              ! первого порядка методом Эйлера
implicit none
     
     type ( input_type ) input ! Входящие данные
     type ( result_type ) result ! Результат

     call read(input) ! [Считывание входящих данных]

     call allocate(result, input) ! [Выделение памяти под результат]

     call solve_euler(input, result) ! [Решение по методу Эйлера]
     call write(result) ! [Вывод результата]

     call deallocate(result) ! [Освобождение памяти из-под результата]

end program main