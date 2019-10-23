submodule ( jacobi_m ) the_matrix_is_not_diagonal_s ! Подмодуль, содержащий функцию,
                                                    ! проверяющую, диагональна ли матрица
implicit none
     
     contains
     
     ! Функция, проверяющая, диагональна ли матрица
     module procedure the_matrix_is_not_diagonal
          
          ! Сумма внедиагональных элементов
          real(RP) :: s

          ! Вспомогательные переменные
          integer(JP) :: m, l

          is_not = .true.
          s = 0._RP

          rows_cycle : do m = 1_JP, N_JP - 1_JP

               cols_cycle : do l = m + 1_JP, N_JP

                    s = s + matrix(l, m) ** 2 + matrix(m, l) ** 2

               enddo cols_cycle

          enddo rows_cycle

          if ( sqrt(s) .lt. 1e-10_RP ) is_not = .false.

     end procedure the_matrix_is_not_diagonal
     
end submodule the_matrix_is_not_diagonal_s