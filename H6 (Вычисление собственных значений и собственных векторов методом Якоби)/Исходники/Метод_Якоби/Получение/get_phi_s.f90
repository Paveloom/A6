submodule ( jacobi_m ) get_phi_s ! Подмодуль, содержащий функцию, 
                                 ! возвращающую угол поворота матрицы вращения
implicit none
     
     contains
     
     ! Функция, возвращающая угол поворота матрицы вращения
     module procedure get_phi
          
          real(RP) :: a_diff ! Разница a(i, i) - a(j, j)

          ! Фактический аргумент — матрица
          if ( present(matrix) ) then

               ! Вычисление разницы a(i, i) - a(j, j)

               a_diff = matrix(max%j, max%j) - matrix(max%i, max%i)

               ! Вычисление угла поворота матрицы вращения
               
               if ( abs(a_diff) .ge. 1e-12_RP ) then
                    
                    phi = 1._RP / 2._RP * atan(2._RP * max%value / a_diff )

               else

                    phi = sign(1._RP, matrix(max%i, max%j)) * pi / 4._RP
               
               endif

          ! Фактический аргумент — указатель на матрицу
          elseif ( present(matrix_pointer) ) then

               ! Вычисление разницы a(i, i) - a(j, j)

               a_diff = matrix_pointer(max%j, max%j) - matrix_pointer(max%i, max%i)

               ! Вычисление угла поворота матрицы вращения
               
               if ( abs(a_diff) .ge. 1e-12_RP ) then
                    
                    phi = 1._RP / 2._RP * atan(2._RP * max%value / a_diff )

               else

                    phi = sign(1._RP, matrix_pointer(max%i, max%j)) * pi / 4._RP
               
               endif

          endif
          
     end procedure get_phi
     
end submodule get_phi_s