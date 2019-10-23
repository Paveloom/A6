module jacobi_m ! Модуль, содержащий процедуру, реализующую метод Якоби для поиска
                ! собственных значений и векторов симметричных матриц
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & FP, & ! Число байт для хранения вспомогательной строки
                 & LP    ! Число байт для хранения логической переменной
use input_m, only : input_type ! Тип, определяющий входные данные
use result_m, only : result_type ! Тип, определяющий результат
use settings_m, only : settings_type ! Тип, определяющий настройки программы
use jacobi_warns_m, only : log_jacobi_error ! Процедура для вывода ошибок для 
                                            ! других процедур, связанных с методом Якоби
implicit none
     
     private
     public :: apply_jacobi ! Процедура, реализующая метод Якоби для поиска
                            ! собственных значений и векторов симметричных матриц

     ! Тип, определяющий внедиагональный максимум и его компоненты
     type max_type

          real(RP) :: value   ! Значение
          integer(JP) :: i, j ! Индексы

     end type max_type
     
     interface

          ! Процедура общего вызова процедуры, реализующей метод Якоби для поиска
          ! собственных значений и векторов симметричных матриц
          module impure subroutine apply_jacobi(input, result, settings)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
               type ( settings_type ), intent(in) :: settings ! Настройки программы
          
          end subroutine apply_jacobi
     
          ! Процедура, реализующая метод Якоби для поиска
          ! собственных значений и векторов симметричных матриц
          ! (с дополнительным выводом)
          module impure subroutine apply_jacobi_loud(input, result)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine apply_jacobi_loud

          ! Процедура, реализующая метод Якоби для поиска
          ! собственных значений и векторов симметричных матриц
          ! (без дополнительного вывода)
          module impure subroutine apply_jacobi_silent(input, result)
          implicit none
          
               type ( input_type ), intent(inout) :: input ! Входные данные
               type ( result_type ), intent(inout) :: result ! Результат
          
          end subroutine apply_jacobi_silent

          ! Процедура, выделяющая память под
          ! локальную и глобальную матрицы вращения,
          ! а также под новую матрицу объекта
          module impure subroutine allocate(N_JP, U, U_k, NA)
          implicit none
          
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица вращения (глобальная)
               real(RP), dimension(:, :), allocatable, intent(inout) :: U

               ! Матрица вращения (итерационная)
               real(RP), dimension(:, :), allocatable, intent(inout) :: U_k

               ! Новая матрица объекта
               real(RP), dimension(:, :), allocatable, intent(inout) :: NA

          end subroutine allocate

          ! Процедура, освобождающая память из-под
          ! локальной и глобальной матриц вращения,
          ! а также из-под новой матрицы объекта
          module impure subroutine deallocate(U, U_k, NA)
          implicit none
          
               ! Матрица вращения (глобальная)
               real(RP), dimension(:, :), allocatable, intent(inout) :: U

               ! Матрица вращения (итерационная)
               real(RP), dimension(:, :), allocatable, intent(inout) :: U_k

               ! Новая матрица объекта
               real(RP), dimension(:, :), allocatable, intent(inout) :: NA

          end subroutine deallocate

          ! Процедура, проверяющая, является ли
          ! матрица на входе симметричной
          module impure subroutine test_if_the_matrix_is_symmetric(N_JP, matrix)
          implicit none
               
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица объекта
               real(RP), dimension(:,:), pointer, intent(in) :: matrix
               
          end subroutine test_if_the_matrix_is_symmetric

          ! Функция, проверяющая, диагональна ли матрица
          module pure function the_matrix_is_not_diagonal(N_JP, matrix) result(is_not)
          implicit none
               
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица объекта
               real(RP), dimension(:,:), contiguous, intent(in) :: matrix

               ! Логическая переменная, отражающая результат
               logical(LP) :: is_not
               
          end function the_matrix_is_not_diagonal

          ! Процедура, возвращающая максимум среди внедиагональных
          ! элементов матрицы, а также его индексы
          module pure subroutine get_max(N_JP, matrix, max)
          implicit none
               
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица объекта
               real(RP), dimension(:,:), contiguous, intent(in) :: matrix
               
               ! Внедиагональный максимум и его индексы
               type ( max_type ), intent(out) :: max
               
          end subroutine get_max

          ! Функция, возвращающая угол поворота матрицы вращения
          module pure function get_phi(matrix, max, pi) result(phi)
          implicit none
               
               ! Матрица объекта
               real(RP), dimension(:,:), contiguous, intent(in) :: matrix
               
               ! Внедиагональный максимум и его индексы
               type ( max_type ), intent(in) :: max

               ! Число pi
               real(RP), intent(in) :: pi

               ! Угол поворота матрицы вращения
               real(RP) :: phi
               
          end function get_phi

          ! Процедура для получения матрицы вращения
          module pure subroutine get_rotation_matrix(phi, N_JP, max, rotation_matrix)
          implicit none
               
               ! Угол поворота матрицы вращения
               real(RP), intent(in) :: phi

               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Внедиагональный максимум и его индексы
               type ( max_type ), intent(in) :: max

               ! Матрица вращения
               real(RP), dimension(:, :), contiguous, intent(inout) :: rotation_matrix
               
          end subroutine get_rotation_matrix

          ! Процедура для получения матрицы вращения
          module impure subroutine send_result(N_JP, U, NA, result)
          implicit none
               
               ! Число строк в матрице
               integer(JP), intent(in) :: N_JP

               ! Матрица вращения (глобальная)
               real(RP), dimension(:, :), contiguous, intent(in) :: U

               ! Новая матрица объекта
               real(RP), dimension(:, :), contiguous, intent(in) :: NA

               ! Результат
               type ( result_type ), intent(inout) :: result
               
          end subroutine send_result
     
     end interface
     
end module jacobi_m