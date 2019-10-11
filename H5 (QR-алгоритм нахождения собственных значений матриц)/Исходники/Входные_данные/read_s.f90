submodule ( input_m ) read_s ! Подмодуль, содержащий процедуру для
                             ! считывания входных данных
implicit none
     
     contains
     
     ! Процедура для выделения памяти / считывания входных данных
     module procedure read
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call log_input_error('WO', file) ! Проверка на ошибку открытия файла

          read( unit = unit, fmt = '()' )
          read( unit = unit, fmt = * , iostat = stat ) input%N ! Считывание числа строк матрицы
          if ( stat .ne. 0_SP ) call log_input_error('WR_N', file) ! Проверка на ошибку считывания

          allocate( input%matrix(input%N, input%N), stat = stat ) ! Выделение памяти под матрицу объекта
          if ( stat .ne. 0_SP ) call log_input_error('WA_matrix') ! Проверка на ошибку выделения памяти

          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat) input%matrix ! Считывание матрицы
          if ( stat .ne. 0_SP ) call log_input_error('WR_matrix', file) ! Проверка на ошибку считывания

          close( unit = unit, iostat = stat)
          if ( stat .ne. 0_SP ) call log_input_error('WC', file) ! Проверка на ошибку закрытия файла

     end procedure read
     
end submodule read_s