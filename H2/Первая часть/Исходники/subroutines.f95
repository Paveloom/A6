module subroutines ! Модуль с процедурой для использования метода Монте-Карло
use rand, only : init_random_seed ! Процедура, обновляющая сид для генератора случайных чисел
use checkin, only : rp, & ! Тип вещественных чисел, используемых в программе
                  & check ! Процедура, определяющая число точек, попавших в фигуру
implicit none

     private
     public :: rp,    & ! Тип вещественных чисел, используемых в программе
             & monte_2d ! Процедура, выполняющая метод Монте-Карло на плоскости 
     
     contains

     ! Процедура, выполняющая метод Монте-Карло на плоскости
     subroutine monte_2d(x_min, x_max, y_min, y_max, N, res)
          
          integer(4), intent(in) :: N ! Число псевдослучайных чисел, генерируемых программой

          ! Координаты вершин прямоугольника, ограничивающего данную фигуру 
          real(rp), intent(in) :: x_min, x_max, y_min, y_max

          real(rp), intent(out) :: res ! Результат (площадь фигуры)

          real(rp) :: a, b ! Стороны прямоугольника, описывающего фигуру

          real(rp), dimension(:), allocatable :: u_sample ! Выборка чисел, равномерно распределённых на [0, 1)
          real(rp), dimension(:), allocatable :: x_sample ! Выборка чисел, равномерно распределённых на [x_min, x_max)
          real(rp), dimension(:), allocatable :: y_sample ! Выборка чисел, равномерно распределённых на [y_min, y_max)

          integer(4) :: k ! Число точек, попавших в фигуру

          integer(4) :: ier ! Вспомогательная переменная

          ! [ Вычисление сторон прямоугольника ]

          a = x_max - x_min
          b = y_max - y_min

          ! [ Выделение памяти под массивы ]

          allocate(u_sample(N), stat = ier)
          if (ier .ne. 0) stop 'Не удалось выделить память для массива u_sample'

          allocate(x_sample(N), stat = ier)
          if (ier .ne. 0) stop 'Не удалось выделить память для массива x_sample'

          allocate(y_sample(N), stat = ier)
          if (ier .ne. 0) stop 'Не удалось выделить память для массива y_sample'

          ! [ Получение выборок случайных чисел ]

          call init_random_seed() ! Обновление сида для генератора случайных чисел

          call random_number(u_sample)
          x_sample = u_sample * a + x_min

          call init_random_seed() ! Обновление сида для генератора случайных чисел

          call random_number(u_sample)
          y_sample = u_sample * b + y_min

          deallocate(u_sample) ! Освобождение памяти из под массива u_sample

          ! [ Проверка выборок на число точек, попавших в фигуру ]
          
          call check(x_sample, y_sample, k)

          ! [ Освобождение памяти из под оставшихся массивов ]

          deallocate(x_sample, y_sample)

          ! [ Вычисление ответа ]

          res = a * b * k / N

     end subroutine monte_2d

end module subroutines