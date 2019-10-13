module givens_rotations_m ! Модуль, содержащий функцию для получения
                          ! коэффициентов c и s, необходимых для
                          ! осуществления поворота Гивенса
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & JP    ! Точность целого числа счетчика
use input_m, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: get_givens_rotation_coefs_loud, & ! Функция для получения коэффициентов 
                                                 ! c и s, необходимых для осуществления
                                                 ! поворота Гивенса
             & make_a_hessenberg_qr_step_loud, sgn

     interface
     
          ! Процедура для получения коэффициентов c и s, 
          ! необходимых для осуществления поворота Гивенса
          ! (с дополнительным выводом)
          module subroutine get_givens_rotation_coefs_loud(f, g, c, s) 
          implicit none
          
               ! Преобразуемые элементы
               complex(CP), intent(in) :: f, g
               
               ! Коэффициенты поворота
               complex(CP), intent(out) :: c, s
          
          end subroutine get_givens_rotation_coefs_loud

          ! Процедура, выполняющая шаг QR-разложения
          ! и RQ-композиции для матрицы Хессенберга
          ! с дополнительным выводом
          module subroutine make_a_hessenberg_qr_step_loud(input, m) 
               implicit none
               
                    type ( input_type ) input ! Входные данные
                    integer(JP) m ! Активный размер матрицы
                    
               end subroutine make_a_hessenberg_qr_step_loud

          ! Вспомогательная функция, переопределяющая функцию
          ! sign для случая комплексных чисел
          module pure complex(CP) function sgn(x)
          implicit none
               
               ! Аргумент функции
               complex(CP), intent(in) :: x
               
          end function sgn
     
     end interface
     
     
end module givens_rotations_m