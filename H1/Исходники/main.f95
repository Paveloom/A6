program main
use subprograms
implicit none
     
     integer(4) :: n ! Число узлов (степень полинома Лежандра)
     real(8) :: a, b ! Границы промежутка
     
     ! Корни многочлена Лежандра степени n и соответствующие им веса
     real(8), allocatable, dimension(:) :: t, w

     integer(4) :: ier, i ! Вспомогательные переменные

     ! Выделение памяти под массивы

     allocate(t(n), stat = ier)
     if (ier .ne. 0) stop 'Не удалось выделить память для массива t'

     allocate(w(n), stat = ier)
     if (ier .ne. 0) stop 'Не удалось выделить память для массива w'

     ! Считывание числа узлов (степени полинома Лежандра)
     read(*,'()'); read(*,*) n

     ! Считывание границ промежутка
     read(*,'(//)'); read(*,*) a; read(*,*) b

     ! Считывание корней многочлена Лежандра степени n и соответствующих им весов
     read(*,'(//)'); read(*,*) (t(i), w(i), i = 1, n)

     deallocate(t, w)
     
end program main