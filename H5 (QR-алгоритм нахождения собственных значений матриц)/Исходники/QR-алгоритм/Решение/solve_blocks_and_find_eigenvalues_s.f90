submodule ( blocks_solver_m ) solve_blocks_and_find_eigenvalues_s ! Подмодуль, содержащий процедуру, 
                                                                  ! выполняющая поиск собственных чисел
                                                                  ! и решение блоков в квазитреугольной
                                                                  ! вещественной матрице
implicit none
     
     contains
     
     ! Процедура, выполняющая поиск собственных чисел
     ! и решение блоков в квазитреугольной вещественной матрице
     module procedure solve_blocks_and_find_eigenvalues
          
          ! Число строк матрицы
          integer(JP) :: N

          ! Дискриминант
          real(RP) :: D

          ! Корень из дискриминанта
          complex(CP) :: sqD

          ! Элементы блока
          real(RP) :: a1, a2, a3, a4

          ! Сумма a1 + a4
          real(RP) :: sa14

          ! Значение суммы a1 + a4, записанное
          ! в комплексную переменную
          complex(CP) :: cp_sa14

          ! Массив собственных чисел
          complex(CP), allocatable, dimension(:) :: evalues

          ! Статусная переменная
          integer(SP) :: stat

          ! Вспомогательные переменные
          integer(JP) :: i, k

          ! Вычисление числа строк матрицы
          N = size(matrix(1_JP, :))

          ! Выделение памяти под массив собственных чисел
          allocate(evalues(N), stat = stat)

          ! Проверка на ошибку выделения памяти
          if ( stat .ne. 0_SP ) then 

               write(*,'(/, 5x, a, /, 5x, a, /)') 'solve_blocks_and_find_eigenvalues:', 'Не удалось выделить память под&
                                                                                       & временный размещаемый массив evalues.'
               stop

          endif

          ! Статусная переменная для найденных блоков:
          ! 0_JP — блок не был найден, выполнить итерацию;
          ! 1_JP — блок был найден, пропустить итерацию,
          !        обнулить значение k
          k = 0_JP

          ! Проверка по главной диагонали и первой поддиагонали
          check : do i = int(N, kind = JP), 2_JP, -1_JP

               if (k .eq. 1_JP) then

                    k = 0_JP
                    cycle check

               endif
               
               if ( abs(matrix(i - 1_JP, i)) .lt. 1e-8_RP ) then

                    evalues(i) = cmplx(matrix(i, i), 0._RP, kind = CP)

               else

                    ! Присвоение значения статусной переменной:
                    ! блок найден
                    k = 1_JP

                    ! Определение элементов блока
                    a1 = matrix(i - 1_JP, i - 1_JP)
                    a2 = matrix(i, i - 1_JP)
                    a3 = matrix(i - 1_JP, i)
                    a4 = matrix(i, i)

                    ! Вычисление суммы a1 + a4
                    sa14 = a1 + a4

                    ! Запись суммы a1 + a4 в комплексную переменную
                    cp_sa14 = cmplx(sa14, 0._RP, kind = CP)

                    ! Вычисление дискриминанта
                    D = sa14 * sa14 - 4._RP * (a1 * a4 - a2 * a3)

                    ! Вычисление корня из дискриминанта
                    sqD = sqrt(cmplx(D, 0._RP, kind = CP))

                    ! Вычисление собственных чисел
                    evalues(i) = ( cp_sa14 + sqD ) / cmplx(2._RP, 0._RP, kind = CP)
                    evalues(i - 1_JP) = conjg(evalues(i))

               endif

          enddo check

          ! Проверка первого элемента на главной диагонали
          if (k .eq. 0_JP) then

               evalues(1_JP) = cmplx(matrix(1_JP, 1_JP), 0._RP, kind = CP)

          endif

          ! Запись результата
          call result%put_evalues(evalues)

          ! Освобождение памяти из-под массива собственных чисел
          deallocate(evalues, stat = stat)

          ! Проверка на ошибку освобождения памяти
          if ( stat .ne. 0_SP ) then 

               write(*,'(/, 5x, a, /, 5x, a, /)') 'solve_blocks_and_find_eigenvalues:', 'Не удалось освободить память из-под&
                                                                                       & временного размещаемого массива evalues.'
               stop

          endif

     end procedure solve_blocks_and_find_eigenvalues
     
end submodule solve_blocks_and_find_eigenvalues_s