submodule ( input_m ) read_sub ! Подмодуль с процедурой для считывания начальных данных
implicit none

     contains

     ! Процедура для выделения памяти / считывания начальных данных
     module procedure read
          
          character(20) :: ls_ftype_temp ! Временная строка для хранения типа функции для использования МНК

          read(*,'()'); read(*,*) ls_ftype_temp ! Считывание типа функции для использования МНК
          input%ls_ftype = trim(ls_ftype_temp) ! Запись типа функции для использования МНК

          read(*,'(/)'); read(*,*) input%N ! Считывание длины матрицы входных данных

          allocate( input%matrix(2, input%N) ) ! Выделение памяти под матрицу входных данных
          read(*,'(/)'); read(*,*) input%matrix ! Считывание матрицы входных данных

     end procedure read

end submodule read_sub