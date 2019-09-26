module adams ! Модуль, содержащий процедуру для решения дифференциального уравнения
             ! первого порядка четырехшаговым методом Адамса-Башфорта
use prec, only : rp ! Точность вещественных чисел, используемых в программе
use input, only : input_type ! Тип, определяющий начальные данные
use result, only : result_type ! Тип, определяющий результат
use function, only : f ! Функция, описывающая правую часть дифференциального уравнения
implicit none
     
     private
     public :: solve_adams_bashforth_o4 ! Процедура, решающая дифференциальное уравнение
                                        ! первого порядка четырехшаговым методом Адамса-Башфорта
     
     contains
     
     ! Процедура, решающая дифференциальное уравнение первого порядка четырехшаговым методом Адамса-Башфорта
     subroutine solve_adams_bashforth_o4(input, result)
          
          type ( input_type ), intent(in) :: input      ! Входящие данные
          type ( result_type ), intent(inout) :: result ! Результат (объект)

          real(rp) :: h ! Расчетный шаг
          real(rp) :: h_half ! Половина расчетного шага

          real(rp) :: k_1, k_2, k_3, k_4 ! Инкременты классического метода Рунге-Кутты
          real(rp) :: k_x ! Держатель аргумента для инкрементов k_2 и k_3

          real(rp) :: x_prev, y_prev ! Держатели предыдущей пары x и y
          
          integer(4) :: i ! Вспомогательная переменная

          associate( N => input%N,            & ! Число узлов, вычисляемых методами
                   & x_0 => input%x_0,        & ! Начальные данные
                   & y_0 => input%y_0,        &
                   & x_N => input%x_N,        & ! Значение правой границы отрезка
                   & result => result%result, & ! Результат (матрица)
                   & id => result%id          ) ! Идентификатор, указывающий, какой процедурой получен результат

               h = ( x_N - x_0 ) / N ! Вычисление расчетного шага
               h_half = h / 2 ! Вычисление половины расчетного шага

               ! Заполнение начальными данными первого столбца матрицы результата

               result(0, 1) = x_0
               result(0, 2) = y_0

               ! Вычисление следующих трех столбцов классическим методом Рунге-Кутты

               runge_kutta : do i = 1, 3

                    ! Вычисление x_i
                    result(i, 1) = x_0 + i * h

                    ! Запись предыдущих значений x_(i-1) и y_(i-1)
                    x_prev = result(i-1, 1)
                    y_prev = result(i-1, 2)

                    ! Вычисление инкрементов классического метода Рунге-Кутты
                    k_1 = h * f( x_prev, y_prev )
                    k_x = x_prev + h_half
                    k_2 = h * f( k_x, y_prev + k_1 / 2 )
                    k_3 = h * f( k_x, y_prev + k_2 / 2 )
                    k_4 = h * f( x_prev + h, y_prev + k_3 )

                    ! Вычисление y_i
                    result(i, 2) = y_prev + 1._rp / 6 * ( k_1 + 2 * k_2 + 2 * k_3 + k_4 )

               end do runge_kutta

               ! Вычисление остальных столбцов четырехшаговым методом Адамса-Башфорта

               adams_bashforth_o4 : do i = 4, N

                    result(i, 1) = x_0 + i * h
                    result(i, 2) = result(i-1, 2) + h * ( 55._rp / 24 * f( result(i-1, 1), result(i-1, 2) )&
                                                      & - 59._rp / 24 * f( result(i-2, 1), result(i-2, 2) )&
                                                      & + 37._rp / 24 * f( result(i-3, 1), result(i-3, 2) )&
                                                      & - 9._rp / 24 * f( result(i-4, 1), result(i-4, 2) ) ) 

               end do adams_bashforth_o4

               ! Присвоение идентификатора результату
               id = 'adams_bashforth_o4'

          end associate
          
     end subroutine solve_adams_bashforth_o4
     
end module adams