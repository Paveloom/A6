submodule ( jacobi_m ) apply_jacobi_s ! Подмодуль, содержащий процедуру общего вызова
                                      ! процедуры, реализующей метод Якоби для поиска
                                      ! собственных значений и векторов симметричных матриц
implicit none
     
     contains
     
     ! Процедура общего вызова процедуры, реализующей метод Якоби для поиска
     ! собственных значений и векторов симметричных матриц
     module procedure apply_jacobi
          
          ! Проверка ответа на вопрос
          if ( settings%get_do_show_info() ) then

               ! С дополнительным выводом
               call apply_jacobi_loud(input, result)

          else

               ! Без дополнительного вывода
               call apply_jacobi_silent(input, result)

          endif
          
     end procedure apply_jacobi
     
end submodule apply_jacobi_s