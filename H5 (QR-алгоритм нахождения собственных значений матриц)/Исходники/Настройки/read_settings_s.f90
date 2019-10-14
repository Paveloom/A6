submodule ( settings_m ) read_settings_s ! Подмодуль, содержащий процедуру для
                                         ! считывания настроек программы 
implicit none
     
     contains
     
     ! Процедура для считывания настроек программы
     module procedure read_settings
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call log_settings_error('WO', file) ! Проверка на ошибку открытия файла

          ! Считывание ответа на первый вопрос
          read( unit = unit, fmt = '()' )
          read( unit = unit, fmt = * , iostat = stat ) settings%do_show_householder_reduction
          if ( stat .ne. 0_SP ) call log_settings_error('WR_Q1', file) ! Проверка на ошибку считывания

          ! Считывание ответа на второй вопрос
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = * , iostat = stat ) settings%do_show_hqr
          if ( stat .ne. 0_SP ) call log_settings_error('WR_Q2', file) ! Проверка на ошибку считывания

          ! Считывание первого ограничения
          read( unit = unit, fmt = '(///)' )
          read( unit = unit, fmt = * , iostat = stat ) settings%hqr_err
          if ( stat .ne. 0_SP ) call log_settings_error('WR_hqr_err', file) ! Проверка на ошибку считывания

          ! Считывание второго ограничения
          read( unit = unit, fmt = '(//)' )
          read( unit = unit, fmt = * , iostat = stat ) settings%fqr_err
          if ( stat .ne. 0_SP ) call log_settings_error('WR_fqr_err', file) ! Проверка на ошибку считывания

          close( unit = unit, iostat = stat) ! Закрытие файла
          if ( stat .ne. 0_SP ) call log_settings_error('WC', file) ! Проверка на ошибку закрытия файла
          
     end procedure read_settings
     
end submodule read_settings_s