submodule ( lsm_m ) lsm_s ! Подмодуль, содержащий процедуру для 
                          ! общего вызова метода наименьших квадратов
implicit none
     
     contains
     
     ! Процедура для общего вызова метода наименьших квадратов
     module procedure lsm
          
          integer(SP) :: stat ! Статусная переменная

          character(:), allocatable :: ls_ftype ! Тип функции для использования МНК
          character(:), allocatable :: file ! Имя файла для считывания

          ls_ftype = input%get_ls_ftype() ! Получение типа функции
          file = input%get_file() ! Получение имени файла

          select case (ls_ftype) ! Проверка типа функции для использования МНК

               case ('linear') ! Линейная функция

                    call lsm_linear(input, result) ! Вызов МНК для линейной функции

               case ('hyperbolic') ! Гиперболическая функция

                    call lsm_hyperbolic(input, result) ! Вызов МНК для гиперболической функции

               case default ! Неверно указано ключевое слово

                    call log_lsm_error('WT', file) ! Вывод списка доступных ключевых слов

          end select

          deallocate(ls_ftype, stat = stat) ! Освобождение памяти из-под типа функции
          if (stat .ne. 0_SP ) call log_lsm_error('WD_ls_ftype') ! Проверка на ошибку освобождения памяти

          deallocate(file) ! Освобождение памяти из-под имени файла
          if (stat .ne. 0_SP ) call log_lsm_error('WD_file') ! Проверка на ошибку освобождения памяти
          
     end procedure lsm
     
end submodule lsm_s