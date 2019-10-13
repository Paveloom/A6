submodule ( givens_rotations_m ) get_givens_rotation_coefs_loud_s ! Подмодуль, содержащий процедуру для
                                                                  ! получения коэффициентов c и s, 
                                                                  ! необходимых для осуществления поворота Гивенса
                                                                  ! (с дополнительным выводом)
implicit none
     
     contains
     
     ! Процедура для получения коэффициентов c и s, 
     ! необходимых для осуществления поворота Гивенса
     ! (с дополнительным выводом)
     module procedure get_givens_rotation_coefs_loud

          ! Вспомогательные переменные
          complex(CP) :: CP0, CP1 ! Вещественные ноль и единица,
                                  ! записанные в комплексную переменную
          complex(CP) :: cg ! Значение conjg(g)

          complex(CP) :: norm ! Значение sqrt( [abs(f)]^2 + [abs(g)]^2 ),
                              ! записанное в комплексную переменную

          complex(CP) :: CP_abs_f ! Значение abs(f), записанное
                                  ! в комплексную переменную

          real(RP) :: abs_f, abs_g ! Значения abs(f) и abs(g)

          ! Вычисление вспомогательных переменных

          CP0 = cmplx(0._RP, 0._RP, kind = CP)
          CP1 = cmplx(1._RP, 0._RP, kind = CP)

          cg = conjg(g)

          abs_f = abs(f)
          abs_g = abs(g)

          norm = cmplx(sqrt( abs_f ** 2 + abs_g ** 2 ), 0._RP, kind = CP)

          CP_abs_f = cmplx(abs_f, 0._RP, kind = CP)
          
          if ( abs_g .lt. 1e-10_RP ) then ! g = 0

               c = CP1 ! c = 1
               s = CP0 ! s = 0

          elseif ( abs_f .lt. 1e-10_RP ) then ! f = 0

               c = CP0     ! c = 0
               s = sgn(cg) ! s = sgn(conjg(g))

          else ! f != 0 и g != 0

               c = CP_abs_f / norm    ! c = |f| / sqrt( |f|^2 + |g|^2 )
               s = sgn(f) * cg / norm ! s = sgn(f) * conjg(g) / sqrt( |f|^2 + |g|^2 )

          endif

     end procedure get_givens_rotation_coefs_loud
     
end submodule get_givens_rotation_coefs_loud_s