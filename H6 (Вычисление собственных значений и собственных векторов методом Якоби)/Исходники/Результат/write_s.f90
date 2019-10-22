submodule ( result_m ) write_s ! Подмодуль, содержащий процедуру
                               ! для вывода результата
implicit none
     
     contains
     
     ! Процедура для вывода результата
     module procedure write

          ! Вспомогательная переменная
          integer(JP) :: i

          ! Вспомогательная строка для автоформатирования
          character(FP) :: f1
          
          if ( .not. allocated(result%evalues) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Массив собственных чисел evalues не был размещен.&
                                                            & Вывод результата невозможен.'
               stop
                    
          elseif ( .not. allocated(result%evectors) ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'write:', 'Матрица собственных векторов evectors не была размещена.&
                                                            & Вывод результата невозможен.'
               stop

          endif

          write(*,'(/, 5x, a, /)') 'Результат:'

          ! Цикл вывода собственных чисел
          write_cycle : do i = 1_JP, size(result%evalues, kind = JP)

               ! Запись числа i в строку
               write(f1,'(i2)') JP
               write(f1,'(i'//f1//')') i

               write(*,'(5x, a, '//RF//')') 'λ'//trim(adjustl(f1))//' = ', result%evalues(i)

          enddo write_cycle

          write(*,'()')

     end procedure write
     
end submodule write_s