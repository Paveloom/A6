submodule ( settings_m ) get_do_show_shooting_output_s
implicit none
     
     contains
     
     ! Функция  для получения указателя на ответ на вопрос:
     ! показывать вывод на итерациях метода стрельбы?
     module procedure get_do_show_shooting_output
          
          do_show_shooting_output_pt => settings%do_show_shooting_output
          
     end procedure get_do_show_shooting_output
     
end submodule get_do_show_shooting_output_s