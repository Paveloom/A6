submodule ( hqr_m ) hqr_alg_with_rayleigh_quotient_shift_s ! Подмодуль, содержащий процедуру
                                                           ! общего вызова процедур, 
                                                           ! реализующих QR-алгоритм Хаусхолдера
                                                           ! со сдвигом по отношению Релея
implicit none
     
     contains
     
     ! Процедура общего вызова процедур, 
     ! реализующих QR-алгоритм Хаусхолдера
     ! со сдвигом по отношению Релея
     module procedure hqr_alg_with_rayleigh_quotient_shift
          
          logical(LP) :: Q_answer ! Держатель для ответов на вопросы в
                                  ! настройках программы

          complex(CP), allocatable, dimension(:) :: evalues ! Массив собственных чисел

          integer(JP) :: i ! Вспомогательная переменная

          integer(SP) :: stat ! Статусная переменная

          ! Показывать реализацию QR-алгоритма Хаусхолдера?
          Q_answer = settings%get_Q2_answer()      

          if (Q_answer) then

               ! Показывать реализацию QR-алгоритма Хаусхолдера
               call hqr_alg_with_rayleigh_quotient_shift_loud(input, settings)

          else

               ! Не показывать реализацию QR-алгоритма Хаусхолдера
               call hqr_alg_with_rayleigh_quotient_shift_silent(input, settings)

          endif

          ! Выделение памяти под массив собственных чисел
          allocate(evalues(input%N), stat = stat)

          ! Проверка на ошибку выделения памяти
          if ( stat .ne. 0_SP ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'hqr_alg_with_rayleigh_quotient_shift:', 'Не удалось выделить память под &
                                                                                          & временный размещаемый массив evalues.'
               stop
          
          endif

          ! Заполнение массива собственных чисел
          get_evalues : do i = 1_JP, int(input%N, kind = JP)

               evalues(i) = input%matrix(i, i)

          enddo get_evalues

          ! Запись результата
          call result%put_evalues(evalues)

          ! Освобождение памяти из-под массива собственных чисел
          deallocate(evalues, stat = stat)

          ! Проверка на ошибку выделения памяти
          if ( stat .ne. 0_SP ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'hqr_alg_with_rayleigh_quotient_shift:', 'Не удалось освободить память из-под &
                                                                                          & временного размещаемого массива evalues.'
               stop
          
          endif

     end procedure hqr_alg_with_rayleigh_quotient_shift
     
end submodule hqr_alg_with_rayleigh_quotient_shift_s