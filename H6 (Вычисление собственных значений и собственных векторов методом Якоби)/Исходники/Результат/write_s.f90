submodule ( result_m ) write_s ! Подмодуль, содержащий процедуру
                               ! для вывода результата
implicit none
     
     contains
     
     ! Процедура для вывода результата
     module procedure write

          ! Число строк матрицы
          integer(JP) :: N_JP

          ! Вспомогательная переменная
          integer(JP) :: i

          ! Вспомогательная строка для автоформатирования
          character(FP) :: f1, f2, f3
          
          if ( .not. allocated(result%evalues) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Массив собственных чисел evalues не был размещен.&
                                                            & Вывод результата невозможен.'
               stop
                    
          elseif ( .not. allocated(result%evectors) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Матрица собственных векторов evectors не была размещена.&
                                                            & Вывод результата невозможен.'
               stop

          endif

          ! Вычисление числа строк матрицы
          N_JP = size(result%evalues, kind = JP)

          ! Запись числа JP в строку
          write(f1,'(i2)') JP

          ! Запись числа N_JP в строку
          write(f3,'(i'//f1//')') N_JP

          write(*,'(/, 5x, a, /)') 'Результат:'

          ! Цикл вывода собственных чисел
          write_evalues : do i = 1_JP, N_JP

               ! Запись числа i в строку
               write(f2,'(i'//f1//')') i

               ! Вывод собственного числа
               write(*,'(5x, a, '//RF//')') 'λ'//trim(adjustl(f2))//' = ', result%evalues(i)

          enddo write_evalues

          write(*,'()')

          ! Цикл вывода собственных векторов
          write_evectors : do i = 1_JP, N_JP

               ! Запись числа i в строку
               write(f2,'(i'//f1//')') i

               ! Вывод собственного вектора
               write(*,'(5x, a, '//f3//'('//RF//', 4x))') 'v'//trim(adjustl(f2))//' = ', result%evectors(i, :)

          enddo write_evectors

          write(*,'()')

     end procedure write
     
end submodule write_s