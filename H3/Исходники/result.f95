module result ! Модуль, отвечающий за хранение и вывод результата
use prec, only : rp, & ! Точность вещественных чисел, используемых в программе
               & ip, & ! Точность целых чисел, используемых в программе
               & rf    ! Формат вывода вещественных чисел
use input, only : input_type ! Тип, определяющий начальные данные
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий начальные данные
             & allocate,    & ! Процедура, выделяющая память под результат
             & deallocate,  & ! Процедура, освобождающая память из-под результата
             & write          ! Процедура, выводящая результат
     
     ! Тип, определяющий начальные данные
     type result_type
          
          real(rp), allocatable, dimension(:,:) :: result ! Результат (матрица)
          character(5) :: id ! Идентификатор, указывающий, какой процедурой получен результат
          
     end type result_type

     contains
     
     ! Процедура, выделяющая память под результат
     pure subroutine allocate(result, input)
          
          type ( input_type ), intent(in) :: input ! Входящие данные
          type ( result_type ), intent(out) :: result ! Результат (объект)

          allocate( result%result(0:input%N, 2) )
          
     end subroutine allocate

     ! Процедура, освобождающая память из-под результата
     pure subroutine deallocate(result)

          type ( result_type ), intent(inout) :: result ! Результат (объект)

          deallocate( result%result )

     end subroutine deallocate

     ! Процедура, выводящая результат
     subroutine write(result)
          
          type ( result_type ), intent(in) :: result ! Результат (объект)

          integer(ip) :: N   ! Держатель размера строчки матрицы результата

          integer(4) :: i, j  ! Вспомогательные переменные
          character(20) :: f1 ! Вспомогательная переменная для автоформатирования

          associate ( result => result%result, & ! Результат (матрица)
                    & id => result%id          ) ! Идентификатор, указывающий, какой процедурой получен результат

               N = size(result(:, 1))

               ! Запись формата для автоформатирования целых чисел
               write(f1, *) N - 1
               write(f1, *) len(trim(adjustl(f1)))

               ! Вывод результата для метода Эйлера
               if ( id .eq. 'euler' ) then

                    open(10, file = 'euler.dat', status = 'replace')

                    write(10,'(/, 4x, '//f1//'x, a, /)') 'Результат, полученный методом Эйлера'
                    write(10,'(5x, i'//f1//', '//rf//', '//rf//')') ( i, ( result(i, j), j = 1, 2 ), i = 0, N - 1 )

                    close(10)
               
               end if

          end associate

     end subroutine write
     
end module result