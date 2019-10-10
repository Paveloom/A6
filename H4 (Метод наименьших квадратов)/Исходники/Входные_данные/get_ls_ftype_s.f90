submodule ( input_m ) get_ls_ftype_s ! Подмодуль, содержащий процедуру
                                     ! для получения типа функции для использования МНК
implicit none
     
     contains
     
     ! Функция для получения типа функции для использования МНК
     module procedure get_ls_ftype
          
          ls_ftype = input%ls_ftype
          
     end procedure get_ls_ftype
     
end submodule get_ls_ftype_s
