module result ! Модуль, отвечающий за хранение и вывод результата
use prec, only : rp, & ! Точность вещественных чисел, используемых в программе
               & ip, & ! Точность целых чисел, используемых в программе
               & rf    ! Формат вывода вещественных чисел
use input, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: result_type, & ! Тип, определяющий результат
             & allocate,    & ! Процедура, выделяющая память под результат
             & deallocate,  & ! Процедура, освобождающая память из-под результата
             & write          ! Процедура, выводящая результат
     
     ! Тип, определяющий результат
     type result_type
          
          real(rp), allocatable, dimension(:,:) :: result ! Результат (матрица)
          character(18) :: id ! Идентификатор, указывающий, какой процедурой получен результат
          
     end type result_type

     integer(1), parameter :: unit = 10  ! Номер дескриптора файла
     integer(4) :: i, j ! Вспомогательные переменные

     contains
     
     ! Процедура, выделяющая память под результат
     pure subroutine allocate(result, input)
          
          type ( input_type ), intent(in) :: input ! Входные данные
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

          integer(ip) :: N ! Держатель размера строчки матрицы результата

          character(20) :: f1 ! Вспомогательная переменная для автоформатирования

          associate ( result => result%result, & ! Результат (матрица)
                    & id => result%id          ) ! Идентификатор, указывающий, какой процедурой получен результат

               N = size(result(:, 1))

               ! Запись формата для автоформатирования целых чисел
               write(f1, *) N - 1
               write(f1, *) len(trim(adjustl(f1)))

               ! Вывод результата для метода Эйлера
               write : select case(id)

               case ('euler')

                    open(unit, file = 'Результат/euler.dat', status = 'replace')

                    write(unit,'(/, 4x, '//f1//'x, a, /)') 'Результат, полученный методом Эйлера'
                    call write_result_matrix(result, N, f1)

                    close(unit)
               
               ! Вывод результата для классического метода Рунге-Кутты
               case ('runge_kutta')

                    open(unit, file = 'Результат/runge_kutta.dat', status = 'replace')

                    write(unit,'(/, 4x, '//f1//'x, a, /)') 'Результат, полученный &
                    &классическим методом Рунге-Кутты'
                    call write_result_matrix(result, N, f1)

                    close(unit)

               case ('adams_bashforth_o4')

                    open(unit, file = 'Результат/adams.dat', status = 'replace')

                    write(unit,'(/, 4x, '//f1//'x, a, /)') 'Результат, полученный &
                    &четырехшаговым методом Адамса-Башфорта'
                    call write_result_matrix(result, N, f1)

                    close(unit)

               end select write

          end associate

     end subroutine write

     ! Процедура для вывода матрицы результата
     subroutine write_result_matrix(result, N, f1)

          real(rp), dimension(0:,:) :: result ! Результат (матрица)
          integer(ip), intent(in) :: N ! Держатель размера строчки матрицы результата
          character(*), intent(in) :: f1 ! Вспомогательная переменная для автоформатирования

          write(unit,'(5x, i'//f1//', '//rf//', '//rf//')') ( i, ( result(i, j), j = 1, 2 ), i = 0, N - 1 )
          write(unit,'()')
          
     end subroutine write_result_matrix
     
end module result