submodule ( settings_m ) get_do_read_gamma_1_s
implicit none
     
     contains
     
     ! Функция для получения указателя на ответ на вопрос:
     ! считывать значение параметра gamma_1?
     module procedure get_do_read_gamma_1
          
          do_read_gamma_1_pt => settings%do_read_gamma_1
          
     end procedure get_do_read_gamma_1
     
end submodule get_do_read_gamma_1_s