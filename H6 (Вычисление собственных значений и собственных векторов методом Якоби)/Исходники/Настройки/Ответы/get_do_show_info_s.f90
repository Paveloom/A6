submodule ( settings_m ) get_do_show_info_s ! Подмодуль, содержащий функцию для 
                                            ! получения ответа на вопрос:
                                            ! показывать дополнительную информацию?
implicit none
     
     contains
     
     ! Функция для получения ответа на вопрос:
     ! показывать дополнительную информацию?
     module procedure get_do_show_info
          
          do_show_info = settings%do_show_info
          
     end procedure get_do_show_info
     
end submodule get_do_show_info_s