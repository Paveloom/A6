submodule ( settings_m ) get_do_read_r_s
implicit none
     
     contains
     
     ! Функция для получения указателя на ответ на вопрос:
     ! считывать значение правой границы промежутка?
     module procedure get_do_read_r
          
          do_read_r_pt => settings%do_read_r
          
     end procedure get_do_read_r
     
end submodule get_do_read_r_s