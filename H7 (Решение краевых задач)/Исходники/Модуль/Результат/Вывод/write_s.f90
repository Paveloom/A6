submodule ( result_m ) write_s
implicit none
     
     contains
     
     ! Процедура для вывода результата
     module procedure write

          ! Число разбиений промежутка (счётчик)
          integer(JP) :: n_JP

          ! Вспомогательная переменная
          integer(JP) :: i

          ! Вспомогательная строка для автоформатирования
          character(FP) :: f1
          
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

          ! Получение и конвертация числа разбиений промежутка
          n_JP = size(result%x, kind = JP) - 1_JP

          ! Запись числа JP в строку
          write(f1, *) n_JP

          ! Определение максимального числа цифр для записи целых чисел
          write(f1, *) len(trim(adjustl(f1)))

          ! Вывод заголовка
          write(*,'(/, 5x, a, /)') 'Результат:'
          write(*,'('//f1//'x, 5x, a, 13x, a, 21x, a, 20x, a )') '#', 'x', 'y(x)', 'z(x)'

          ! Вывод строчек результата
          write(*,'('//f1//'x, 3x, i'//f1//', 2x, '//RF//', 2x, '//RF//', 2x, '//RF//')') (i, result%x(i), result%y(i), result%z(i), i = 0_JP, n_JP)
          
          ! Добавление пустой строки
          write(*,'()')

     end procedure write
     
end submodule write_s