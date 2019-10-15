submodule ( settings_m ) get_hqr_err_s ! Подмодуль, содержащий функцию 
                                       ! для получения условия сходимости
                                       ! для QR-алгоритма Хаусхолдера
implicit none
     
     contains
     
     ! Функция для получения условия сходимости
     ! для QR-алгоритма Хаусхолдера
     module procedure get_hqr_err
          
          hqr_err = settings%hqr_err
          
     end procedure get_hqr_err
     
end submodule get_hqr_err_s