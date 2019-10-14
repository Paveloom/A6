submodule ( settings_m ) get_do_show_householder_reduction_s ! Подмодуль, содержащий функцию для
                                                             ! получения ответа на вопрос:
                                                             ! показывать реализацию метода Хаусхолдера?
implicit none
     
     contains
     
     ! Функция для получения ответа на вопрос:
     ! показывать реализацию метода Хаусхолдера?
     module procedure get_do_show_householder_reduction
          
          do_show_householder_reduction = settings%do_show_householder_reduction
          
     end procedure get_do_show_householder_reduction
     
end submodule get_do_show_householder_reduction_s