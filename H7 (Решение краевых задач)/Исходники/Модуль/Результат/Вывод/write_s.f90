submodule ( result_m ) write_s
implicit none
     
     contains
     
     ! Процедура для вывода результата
     module procedure write

          ! Число узловых точек
          integer(JP) :: n_JP

          ! Вспомогательная переменная
          integer(JP) :: i

          ! Вспомогательная строка для автоформатирования
          character(FP) :: f1, f2, f3
          
          if ( .not. allocated(result%x) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Массив узловых точек x не был размещен.&
                                                            & Вывод результата невозможен.'
               stop
                    
          elseif ( .not. allocated(result%y) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Массив значений искомой функции y не был размещен.&
                                                            & Вывод результата невозможен.'
               stop

          elseif ( .not. allocated(result%z) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Массив значений производной искомой функции z не был размещен.&
                                                            & Вывод результата невозможен.'
               stop

          endif

          ! Вычисление числа строк матрицы
          n_JP = size(result%x, kind = JP)

          ! Запись числа JP в строку
          write(f1,'(i2)') JP

          ! Запись числа N_JP в строку
          write(f3,'(i'//f1//')') N_JP

          write(*,'(/, 5x, a, /)') 'Результат:'

          write(*,'()')

     end procedure write
     
end submodule write_s