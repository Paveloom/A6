submodule ( settings_m ) get_do_show_fqr_s ! Подмодуль, содержащий функцию для 
                                           ! получения ответа на вопрос:
                                           ! показывать реализацию QR-алгоритма Фрэнсиса?
implicit none
     
     contains
     
     ! Функция для получения ответа на вопрос:
     ! показывать реализацию QR-алгоритма Фрэнсиса?
     module procedure get_do_show_fqr
          
          do_show_fqr = settings%do_show_fqr
          
     end procedure get_do_show_fqr
     
end submodule get_do_show_fqr_s