submodule ( settings_m ) get_do_read_l_s
implicit none
     
     contains
     
     ! Функция для получения указателя на ответ на вопрос:
     ! считывать значение левой границы промежутка?
     module procedure get_do_read_l
          
          do_read_l_pt => settings%do_read_l
          
     end procedure get_do_read_l
     
end submodule get_do_read_l_s