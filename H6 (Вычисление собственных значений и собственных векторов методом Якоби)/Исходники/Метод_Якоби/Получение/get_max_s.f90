submodule ( jacobi_m ) get_max_s ! Подмодуль, содержащий процедуру, возвращающую
                                 ! максимум среди внедиагональных
                                 ! элементов матрицы, а также его индексы
implicit none
     
     contains
     
     ! Процедура, возвращающая максимум среди внедиагональных
     ! элементов матрицы, а также его индексы
     module procedure get_max
          
          ! Вспомогательные переменные
          integer(JP) :: i, j

          ! Фактический аргумент — матрица
          if ( present(matrix) ) then

               ! Начальное предположение

               max%value = abs(matrix(N%m0, N%m1))
               max%i = N%m0
               max%j = N%m1

               ! Поиск внедиагонального максимума
               m_rows_cycle : do j = 1_JP, N%m2

                    m_cols_cycle : do i = j + 1_JP, N%m0

                         if ( abs(matrix(i, j)) - abs(max%value) .gt. 0._RP ) then

                              max%value = matrix(i, j)
                              max%i = i
                              max%j = j

                         endif

                    enddo m_cols_cycle

               enddo m_rows_cycle

               if ( ( max%i .eq. N%m0 ) .and. ( max%j .eq. N%m1 ) ) max%value = matrix(N%m0, N%m1)

          ! Фактический аргумент — указатель на матрицу
          elseif ( present(matrix_pointer) ) then

               ! Начальное предположение

               max%value = abs(matrix_pointer(N%m0, N%m1))
               max%i = N%m0
               max%j = N%m1

               ! Поиск внедиагонального максимума
               mp_rows_cycle : do j = 1_JP, N%m2

                    mp_cols_cycle : do i = j + 1_JP, N%m0

                         if ( abs(matrix_pointer(i, j)) - abs(max%value) .gt. 0._RP ) then

                              max%value = matrix_pointer(i, j)
                              max%i = i
                              max%j = j

                         endif

                    enddo mp_cols_cycle

               enddo mp_rows_cycle

               if ( ( max%i .eq. N%m0 ) .and. ( max%j .eq. N%m1 ) ) max%value = matrix_pointer(N%m0, N%m1)

          endif

     end procedure get_max
     
end submodule get_max_s