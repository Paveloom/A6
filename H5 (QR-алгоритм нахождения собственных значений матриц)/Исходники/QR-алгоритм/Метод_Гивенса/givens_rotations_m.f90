module givens_rotations_m ! Модуль, содержащий функцию для получения
                          ! коэффициентов c и s, необходимых для
                          ! осуществления поворота Гивенса
use prec_m, only : CP, & ! Точность комплексных чисел, используемых в программе
                 & RP    ! Точность вещественных чисел, используемых в программе
implicit none
     
     private
     public :: get_givens_rotation_coefs_loud ! Функция для получения коэффициентов 
                                              ! c и s, необходимых для осуществления
                                              ! поворота Гивенса

     interface
     
          ! Процедура для получения коэффициентов c и s, 
          ! необходимых для осуществления поворота Гивенса
          module subroutine get_givens_rotation_coefs_loud(f, g, c, s) 
          implicit none
          
               ! Преобразуемые элементы
               complex(CP), intent(in) :: f, g
               
               ! Коэффициенты поворота
               complex(CP), intent(out) :: c, s
          
          end subroutine get_givens_rotation_coefs_loud
     
     end interface
     
     
end module givens_rotations_m