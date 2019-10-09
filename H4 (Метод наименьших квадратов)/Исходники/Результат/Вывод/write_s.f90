submodule ( result_m ) write_s ! Подмодуль, содержащий процедуру для вывода результата
implicit none
     
     contains
     
     ! Процедура для вывода результата
     module procedure write
          
          select case (result%ls_ftype) ! Проверка типа функции

          case ('linear') ! Линейная функция

               write(*,'(/, 2(5x, a, /), /, 5x, a, //, 2(5x, a, '//RF//', /), /, 5x, a, '//RF//', /)') &
                                      &'Результат МНК для линейной функции:', &
                                      &'по данным из файла '//result%file//':', &
                                      &'Вид функции: y = a * x + b', &
                                      &'Коэффициент a:', result%coefs(1), &
                                      &'Коэффициент b:', result%coefs(2), &
                                      &'Погрешность метода err:', result%err 

          case ('hyperbolic') ! Гиперболическая функция

               write(*,'(/, 2(5x, a, /), /, 5x, a, //, 2(5x, a, '//RF//', /), /, 5x, a, '//RF//', /)') &
                                      &'Результат МНК для гиперболической функции', &
                                      &'по данным из файла '//result%file//':', &
                                      &'Вид функции: y = a / x + b', &
                                      &'Коэффициент a:', result%coefs(1), &
                                      &'Коэффициент b:', result%coefs(2), &
                                      &'Погрешность метода err:', result%err

          case ('logarithmic') ! Логарифмическая функция

               write(*,'(/, 2(5x, a, /), /, 5x, a, //, 2(5x, a, '//RF//', /), /, 5x, a, '//RF//', /)') &
                                      &'Результат МНК для логарифмической функции', &
                                      &'по данным из файла '//result%file//':', &
                                      &'Вид функции: y = a * ln(x) + b', &
                                      &'Коэффициент a:', result%coefs(1), &
                                      &'Коэффициент b:', result%coefs(2), &
                                      &'Погрешность метода err:', result%err 

          case default

               write(*,'( /, 2(5x, a, /) )') 'write:', 'Неизвестный тип функции ls_ftype.'

          end select
          
     end procedure write
     
end submodule write_s