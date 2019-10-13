submodule ( givens_rotations_m ) sgn_s ! Подмодуль, содержащий вспомогательную
                                       ! функцию, переопределяющая функцию
                                       ! sign для случая комплексных чисел
implicit none
     
     contains
     
     ! Вспомогательная функция, переопределяющая функцию
     ! sign для случая комплексных чисел
     module procedure sgn
          
          if ( abs(x) .lt. 1e-8_RP ) then ! x = 0

               ! sgn(x) = 1
               sgn = cmplx(1._RP, 0._RP, kind = CP)

          else ! x != 0

               ! sgn(x) = x / |x|
               sgn = x / cmplx(abs(x), 0._RP, kind = CP)

          endif
          
     end procedure sgn
     
end submodule sgn_s