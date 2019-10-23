submodule ( jacobi_m ) get_rotation_matrix_s ! Подмодуль, содержащий процедуру, 
                                ! действующую на исходную 
                                ! матрицу матрицей вращения
implicit none
     
     contains
     
     ! Процедура, действующая на исходную 
     ! матрицу матрицей вращения
     module procedure get_rotation_matrix
          
          ! Значения косинуса и синуса от угла поворота
          real(RP) :: cos_phi, sin_phi

          ! Вспомогательные переменные
          integer(JP) :: m, l

          ! Вычисление косинуса и синуса от угла поворота
          cos_phi = cos(phi)
          sin_phi = sin(phi)

          if ( abs(cos_phi) .lt. 1e-8_RP ) cos_phi = 0._RP
          if ( abs(sin_phi) .lt. 1e-8_RP ) sin_phi = 0._RP

          ! Построение матрицы вращения

          rows_cycle : do m = 1_JP, N_JP

               cols_cycle : do l = 1_JP, N_JP
               
                    ! Аналитически: элемент с индексами (i, i)
                    if ( ( m .eq. max%j ) .and. ( l .eq. max%j ) ) then

                         rotation_matrix(l, m) = cos_phi

                    ! Аналитически: элемент с индексами (i, j)
                    elseif ( ( m .eq. max%j ) .and. ( l .eq. max%i ) ) then

                         rotation_matrix(l, m) = - sin_phi

                    ! Аналитически: элемент с индексами (j, i)
                    elseif ( ( m .eq. max%i ) .and. ( l .eq. max%j ) ) then

                         rotation_matrix(l, m) = sin_phi

                    ! Аналитически: элемент с индексами (j, j)
                    elseif ( ( m .eq. max%i ) .and. ( l .eq. max%i ) ) then

                         rotation_matrix(l, m) = cos_phi

                    ! Диагональ матрицы
                    elseif ( m .eq. l ) then

                         rotation_matrix(l, m) = 1._RP

                    ! Остальные элементы
                    else

                         rotation_matrix(l, m) = 0._RP

                    endif

               enddo cols_cycle

          enddo rows_cycle

     end procedure get_rotation_matrix
     
end submodule get_rotation_matrix_s