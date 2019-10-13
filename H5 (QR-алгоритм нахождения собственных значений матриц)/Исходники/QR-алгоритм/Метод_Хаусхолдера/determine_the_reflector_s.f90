submodule ( householder_reduction_m ) determine_the_reflector_s ! Подмодуль, содержащий функцию, 
                                                                ! возвращающую рефлектор для столбца
                                                                ! [x, y, z]^T в алгоритме Фрэнсиса с двойным сдвигом
implicit none 
     
     contains
     
     ! Функция, возвращающая рефлектор для столбца
     ! [x, y, z]^T в алгоритме Фрэнсиса с двойным сдвигом
     module procedure determine_the_reflector
          
          ! Вектор Хаусхолдера
          real(RP), dimension(1, 1:3) :: u

          ! Вспомогательная переменная
          integer(JP) :: i

          u = 0._RP
          u(1, 1) = sign(1._RP, xyz_array(1, 1)) * norm2(xyz_array)
          u = xyz_array + u
          u = u / norm2(u)

          PH = - 2._RP * matmul(transpose(u), u)
          
          do i = 1, 3

               PH(i, i) = PH(i, i) + 1._RP

          enddo

     end procedure determine_the_reflector
     
end submodule determine_the_reflector_s