submodule ( settings_m ) get_fqr_err_s ! Функция для получения условия сходимости
                                       ! для QR-алгоритма Фрэнсиса
implicit none
     
     contains
     
     ! Функция для получения условия сходимости
     ! для QR-алгоритма Фрэнсиса
     module procedure get_fqr_err
          
          fqr_err = settings%fqr_err
          
     end procedure get_fqr_err
     
end submodule get_fqr_err_s