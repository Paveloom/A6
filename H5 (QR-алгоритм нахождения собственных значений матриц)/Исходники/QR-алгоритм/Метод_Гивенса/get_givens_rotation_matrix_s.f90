submodule ( givens_rotations_m ) get_givens_rotation_matrix_s ! Подмодуль, содержащий функцию для
                                                              ! получения вещественной матрицы вращения, 
                                                              ! необходимой для QR-алгоритма Фрэнсиса
implicit none
     
     contains
     
     ! Функция для получения вещественной матрицы вращения, 
     ! необходимой для QR-алгоритма Фрэнсиса
     module procedure get_givens_rotation_matrix
          
          real(RP) :: norm ! Значение sqrt( [abs(f)]^2 + [abs(g)]^2 )
          real(RP) :: c, s ! Коэффициенты вращения

          real(RP) :: abs_f, abs_g ! Значения abs(f) и abs(g)

          ! Вычисление вспомогательных переменных

          abs_f = abs(f)
          abs_g = abs(g)

          norm = sqrt( abs_f ** 2 + abs_g ** 2 )

          if ( abs_g .lt. 1e-10_RP ) then ! g = 0

               c = 1._RP
               s = 0._RP

          elseif ( abs_f .lt. 1e-10_RP ) then ! f = 0

               c = 0._RP
               s = sign(1._RP, g)

          else ! f != 0 и g != 0

               c = abs_f / norm
               s = sign(1._RP, f) * g / norm

          endif

          ! Заполнение рефлектора

          PR(1, 1) = c
          PR(2, 1) = -s
          PR(1, 2) = s
          PR(2, 2) = c
          
     end procedure get_givens_rotation_matrix
     
end submodule get_givens_rotation_matrix_s