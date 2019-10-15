submodule ( settings_m ) get_do_show_hqr_s ! Подмодуль, содержащий функцию для 
                                           ! получения ответа на вопрос:
                                           ! показывать реализацию QR-алгоритма Хаусхолдера?
implicit none
     
     contains
     
     ! Функция для получения ответа на вопрос:
     ! показывать реализацию QR-алгоритма Хаусхолдера?
     module procedure get_do_show_hqr
          
          do_show_hqr = settings%do_show_hqr
          
     end procedure get_do_show_hqr
     
end submodule get_do_show_hqr_s