submodule ( householder_reduction_m ) determine_the_reflector_s ! Подмодуль, содержащий функцию, 
                                                                ! возвращающую рефлектор для столбца
                                                                ! [x, y, z]^T в алгоритме Фрэнсиса с двойным сдвигом
implicit none 
     
     contains
     
     ! Функция, возвращающая рефлектор для столбца
     ! [x, y, z]^T в алгоритме Фрэнсиса с двойным сдвигом
     module procedure determine_the_reflector
          
          ! Вектор Хаусхолдера
          real(RP), dimension(1_JP, 1_JP:3_JP) :: u

          ! Вспомогательная переменная
          integer(JP) :: i

          u = 0._RP
          u(1_JP, 1_JP) = sign(1._RP, xyz_array(1_JP, 1_JP)) * norm2(xyz_array)
          u = xyz_array + u
          u = u / norm2(u)

          PH = - 2._RP * matmul(transpose(u), u)
          
          do i = 1_JP, 3_JP

               PH(i, i) = PH(i, i) + 1._RP

          enddo

     end procedure determine_the_reflector
     
end submodule determine_the_reflector_s