submodule ( jacobi_m ) send_result_s ! Подмодуль, содержащий процедуру,
                                     ! записывающую результат
implicit none
     
     contains
     
     ! Процедура, записывающая результат
     module procedure send_result
          
          ! Массив собственных чисел матрицы
          real(RP), dimension(:), allocatable :: evalues

          integer(JP) :: i ! Вспомогательная переменная
          integer(SP) :: stat ! Статусная переменная

          ! Выделение памяти под массив собственных чисел
          allocate(evalues(N%m0), stat = stat)
          if ( stat .ne. 0_SP ) call log_jacobi_error('WA_evalues') ! Проверка на ошибку выделения памяти

          ! Запись собственных чисел

          do i = 1_JP, N%m0

               evalues(i) = NA(i, i)

          enddo

          ! Отправка собственных чисел
          call result%put_evalues(evalues)

          ! Отправка собственных векторов
          call result%put_evectors(U)

          ! Освобождение памяти из-под массива собственных чисел
          deallocate(evalues, stat = stat)
          if ( stat .ne. 0_SP ) call log_jacobi_error('WD_evalues') ! Проверка на ошибку освобождения памяти
          
     end procedure send_result
     
end submodule send_result_s