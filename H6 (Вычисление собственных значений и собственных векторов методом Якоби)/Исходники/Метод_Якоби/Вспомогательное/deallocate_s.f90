submodule ( jacobi_m ) deallocate_s ! Подмодуль, содержащий процедуру, 
                                    ! освобождающую память из-под
                                    ! локальной и глобальной матриц вращения,
                                    ! а также из-под новой матрицы объекта
implicit none
     
     contains
     
     ! Процедура, освобождающая память из-под
     ! локальной и глобальной матриц вращения,
     ! а также из-под новой матрицы объекта
     module procedure deallocate
          
          integer(SP) :: stat ! Статусная переменная

          deallocate(U, stat = stat ) ! Освобождение памяти из-под глобальной матрицы вращения
          if ( stat .ne. 0_SP ) call log_jacobi_error('WD_U') ! Проверка на ошибку освобождения памяти

          deallocate(U_k, stat = stat ) ! Освобождение памяти из-под итерационной матрицы вращения
          if ( stat .ne. 0_SP ) call log_jacobi_error('WD_U_k') ! Проверка на ошибку освобождения памяти

          deallocate(NA, stat = stat ) ! Освобождение памяти из-под новой матрицы объекта
          if ( stat .ne. 0_SP ) call log_jacobi_error('WD_NA') ! Проверка на ошибку освобождения памяти
          
     end procedure deallocate
     
end submodule deallocate_s