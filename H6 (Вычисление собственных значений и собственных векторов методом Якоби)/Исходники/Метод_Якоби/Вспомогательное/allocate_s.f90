submodule ( jacobi_m ) allocate_s ! Подмодуль, содержащий процедуру, 
                                  ! выделяющую память под
                                  ! локальную и глобальную матрицы вращения,
                                  ! а также под новую матрицу объекта
implicit none
     
     contains
     
     ! Процедура, выделяющая память под
     ! локальную и глобальную матрицы вращения,
     ! а также под новую матрицу объекта
     module procedure allocate
          
          integer(SP) :: stat ! Статусная переменная

          allocate(U(N%m0, N%m0), stat = stat ) ! Выделение памяти под глобальную матрицу вращения
          if ( stat .ne. 0_SP ) call log_jacobi_error('WA_U') ! Проверка на ошибку выделения памяти

          allocate(U_k(N%m0, N%m0), stat = stat ) ! Выделение памяти под итерационную матрицу вращения
          if ( stat .ne. 0_SP ) call log_jacobi_error('WA_U_k') ! Проверка на ошибку выделения памяти

          allocate(NA(N%m0, N%m0), stat = stat ) ! Выделение памяти под новую матрицу объекта
          if ( stat .ne. 0_SP ) call log_jacobi_error('WA_NA') ! Проверка на ошибку выделения памяти
          
     end procedure allocate
     
end submodule allocate_s