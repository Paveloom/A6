module givens_rotations_m ! Модуль, содержащий функцию для получения
                          ! коэффициентов c и s, необходимых для
                          ! осуществления поворота Гивенса
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP, & ! Точность вещественных чисел, используемых в программе
                 & JP    ! Точность целого числа счетчика
use input_m, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: get_givens_rotation_coefs, & ! Функция для получения коэффициентов 
                                            ! c и s, необходимых для осуществления
                                            ! поворота Гивенса
             & get_givens_rotation_matrix, & ! Функция для получения вещественной матрицы вращения, 
                                             ! необходимой для QR-алгоритма Фрэнсиса
             & sgn ! Вспомогательная функция, переопределяющая функцию
                   ! sign для случая комплексных чисел

     interface
     
          ! Процедура для получения коэффициентов c и s, 
          ! необходимых для осуществления поворота Гивенса
          module pure subroutine get_givens_rotation_coefs(f, g, c, s) 
          implicit none
          
               ! Преобразуемые элементы
               complex(CP), intent(in) :: f, g
               
               ! Коэффициенты поворота
               complex(CP), intent(out) :: c, s
          
          end subroutine get_givens_rotation_coefs

          ! Функция для получения вещественной матрицы вращения, 
          ! необходимой для QR-алгоритма Фрэнсиса
          module pure function get_givens_rotation_matrix(f, g) result(PR)
          implicit none
               
               ! Преобразуемые элементы
               real(RP), intent(in) :: f, g
                    
               ! Матрица вращения
               real(RP), dimension(2_JP, 2_JP) :: PR
               
          end function get_givens_rotation_matrix

          ! Вспомогательная функция, переопределяющая функцию
          ! sign для случая комплексных чисел
          module pure complex(CP) function sgn(x)
          implicit none
               
               ! Аргумент функции
               complex(CP), intent(in) :: x
               
          end function sgn
     
     end interface
     
     
end module givens_rotations_m