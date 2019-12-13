submodule ( settings_m ) get_do_read_beta_1_s
implicit none
     
     contains
     
     ! Функция для получения указателя на ответ на вопрос:
     ! считывать значение параметра beta_1?
     module procedure get_do_read_beta_1
          
          do_read_beta_1_pt => settings%do_read_beta_1
          
     end procedure get_do_read_beta_1
     
end submodule get_do_read_beta_1_s