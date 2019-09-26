module euler ! Модуль, содержащий процедуру для решения дифференциального уравнения
             ! первого порядка методом Эйлера
use prec, only : rp ! Точность вещественных чисел, используемых в программе
use input, only : input_type ! Тип, определяющий входные данные
use result, only : result_type ! Тип, определяющий результат
use function, only : f ! Функция, описывающая правую часть дифференциального уравнения
implicit none
     
     private
     public :: solve_euler ! Процедура, решающая дифференциальное уравнение
                           ! первого порядка методом Эйлера
     
     contains
     
     ! Процедура, решающая дифференциальное уравнение первого порядка методом Эйлера
     pure subroutine solve_euler(input, result)
          
          type ( input_type ), intent(in) :: input      ! Входные данные
          type ( result_type ), intent(inout) :: result ! Результат (объект)

          real(rp) :: h ! Расчетный шаг
          
          integer(4) :: i ! Вспомогательная переменная

          associate( N => input%N,            & ! Число узлов, вычисляемых методами
                   & x_0 => input%x_0,        & ! Начальные данные
                   & y_0 => input%y_0,        &
                   & x_N => input%x_N,        & ! Значение правой границы отрезка
                   & result => result%result, & ! Результат (матрица)
                   & id => result%id          ) ! Идентификатор, указывающий, какой процедурой получен результат

               h = ( x_N - x_0 ) / N ! Вычисление расчетного шага

               ! Заполнение начальными данными первого столбца матрицы результата

               result(0, 1) = x_0
               result(0, 2) = y_0

               ! Вычисление остальных столбцов

               euler : do i = 1, N

                    result(i, 1) = x_0 + i * h
                    result(i, 2) = result(i-1, 2) + h * f( result(i-1, 1), result(i-1, 2) )

               end do euler

               ! Присвоение идентификатора результату
               id = 'euler'

          end associate
          
     end subroutine solve_euler
     
end module euler