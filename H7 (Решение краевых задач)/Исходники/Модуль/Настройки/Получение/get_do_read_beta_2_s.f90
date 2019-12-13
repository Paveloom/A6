submodule ( settings_m ) get_do_read_beta_2_s
implicit none
     
     contains
     
     ! Функция для получения указателя на ответ на вопрос:
     ! считывать значение параметра beta_2?
     module procedure get_do_read_beta_2
          
          do_read_beta_2_pt => settings%do_read_beta_2
          
     end procedure get_do_read_beta_2
     
end submodule get_do_read_beta_2_s