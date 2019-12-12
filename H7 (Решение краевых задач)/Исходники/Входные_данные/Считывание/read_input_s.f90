submodule ( input_m ) read_input_s
implicit none
     
     contains
     
     ! Процедура для считывания входных данных
     module procedure read_input
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call log_input_error('WO', file) ! Проверка на ошибку открытия файла

          ! Считывание значения левой границы промежутка

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          if (settings%get_do_read_l()) then

               read( unit = unit, fmt = * , iostat = stat ) input%l
               if ( stat .ne. 0_SP ) call log_input_error('WR_l', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )  

          endif

          ! Считывание значения правой границы промежутка

          if (settings%get_do_read_r()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%r
               if ( stat .ne. 0_SP ) call log_input_error('WR_r', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения числа разбиений промежутка
          read( unit = unit, fmt = *, iostat = stat ) input%n
          if ( stat .ne. 0_SP ) call log_input_error('WR_n', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения параметра alpha_1

          if (settings%get_do_read_alpha_1()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%alpha_1
               if ( stat .ne. 0_SP ) call log_input_error('WR_alpha_1', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Считывание значения параметра beta_1

          if (settings%get_do_read_beta_1()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%beta_1
               if ( stat .ne. 0_SP ) call log_input_error('WR_beta_1', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Считывание значения параметра gamma_1

          if (settings%get_do_read_gamma_1()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%gamma_1
               if ( stat .ne. 0_SP ) call log_input_error('WR_gamma_1', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Считывание значения параметра alpha_2

          if (settings%get_do_read_alpha_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%alpha_2
               if ( stat .ne. 0_SP ) call log_input_error('WR_alpha_2', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Считывание значения параметра beta_2

          if (settings%get_do_read_beta_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%beta_2
               if ( stat .ne. 0_SP ) call log_input_error('WR_beta_2', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Считывание значения параметра gamma_2

          if (settings%get_do_read_gamma_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) input%gamma_2
               if ( stat .ne. 0_SP ) call log_input_error('WR_gamma_2', file) ! Проверка на ошибку считывания

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call log_input_error('WC', file) ! Проверка на ошибку закрытия файла

     end procedure read_input
     
end submodule read_input_s