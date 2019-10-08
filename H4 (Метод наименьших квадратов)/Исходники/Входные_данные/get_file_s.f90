submodule ( input_m ) get_file_s
implicit none
     
     contains
     
     ! Функция для получения имени файла для считывания
     module procedure get_file
          
          file = input%file
          
     end procedure get_file
     
end submodule get_file_s