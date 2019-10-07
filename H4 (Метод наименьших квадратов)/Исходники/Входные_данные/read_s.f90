submodule ( input_m ) read_s ! Подмодуль с процедурой для считывания начальных данных
implicit none

     contains

     ! Процедура для выделения памяти / считывания начальных данных
     module procedure read
          
          character(20) :: ls_ftype_temp ! Временная строка для хранения типа функции для использования МНК
          integer(SP) :: stat ! Статусная переменная

          read(*,'()'); read( unit = *, fmt = *, iostat = stat ) ls_ftype_temp ! Считывание типа функции для использования МНК
          if ( stat .ne. 0_SP ) call log_input_error('WR_ls_ftype_temp') ! Проверка на ошибку считывания

          input%ls_ftype = trim(ls_ftype_temp) ! Запись типа функции для использования МНК

          read(*,'(/)'); read( unit = *, fmt = *, iostat = stat ) input%N ! Считывание длины матрицы входных данных
          if ( stat .ne. 0_SP) call log_input_error('WR_N') ! Проверка на ошибку считывания

          allocate( input%matrix(2, input%N), stat = stat ) ! Выделение памяти под матрицу входных данных
          if ( stat .ne. 0_SP ) call log_input_error('WA_matrix') ! Проверка на ошибку выделения памяти
          
          read(*,'(/)'); read( unit = *, fmt = *, iostat = stat ) input%matrix ! Считывание матрицы входных данных
          if ( stat .ne. 0_SP) call log_input_error('WR_matrix') ! Проверка на ошибку считывания

     end procedure read

end submodule read_s