submodule ( input_m ) read_s ! Подмодуль с процедурой для считывания начальных данных
implicit none

     contains

     ! Процедура для выделения памяти / считывания начальных данных
     module procedure read
          
          character(20) :: ls_ftype_temp ! Временная строка для хранения типа функции для использования МНК

          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call log_input_error('WO', file) ! Проверка на ошибку открытия файла

          read( unit = unit, fmt = '()' )
          read( unit = unit, fmt = *, iostat = stat ) ls_ftype_temp ! Считывание типа функции для использования МНК
          if ( stat .ne. 0_SP ) call log_input_error('WR_ls_ftype_temp', file) ! Проверка на ошибку считывания

          input%ls_ftype = trim(ls_ftype_temp) ! Запись типа функции для использования МНК

          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) input%N ! Считывание длины матрицы входных данных
          if ( stat .ne. 0_SP ) call log_input_error('WR_N', file) ! Проверка на ошибку считывания

          allocate( input%matrix(2, input%N), stat = stat ) ! Выделение памяти под матрицу входных данных
          if ( stat .ne. 0_SP ) call log_input_error('WA_matrix') ! Проверка на ошибку выделения памяти

          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) input%matrix ! Считывание матрицы входных данных
          if ( stat .ne. 0_SP ) call log_input_error('WR_matrix', file) ! Проверка на ошибку считывания

          input%file = file ! Запись имени файла для считывания

          close(unit)

     end procedure read

end submodule read_s