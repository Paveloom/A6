submodule ( input_m ) get_gamma_1_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! параметра gamma_1
     module procedure get_gamma_1
          
          gamma_1 = input%gamma_1
          
     end procedure get_gamma_1
     
end submodule get_gamma_1_s