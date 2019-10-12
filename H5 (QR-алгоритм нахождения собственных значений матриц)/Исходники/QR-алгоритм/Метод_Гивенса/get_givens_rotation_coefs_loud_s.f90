submodule ( givens_rotations_m ) get_givens_rotation_coefs_loud_s ! Подмодуль, содержащий процедуру для
                                                                  ! получения коэффициентов c и s, 
                                                                  ! необходимых для осуществления поворота Гивенса
implicit none
     
     contains
     
     ! Процедура для получения коэффициентов c и s, 
     ! необходимых для осуществления поворота Гивенса
     module procedure get_givens_rotation_coefs_loud

          ! Вспомогательные переменные
          real(RP) :: f1, g1, u, f2, g2
          complex(CP) :: gs, fs
          
          if ( abs(g) .lt. 1e-10 ) then ! g = 0

               c = sign(1._RP, real(f))
               s = 0._RP

          elseif ( abs(f) .lt. 1e-10 ) then ! f = 0

               c = 0._RP
               s = conjg(g) / abs(g)

          else

               f1 = abs(real(f)) + abs(aimag(f))
               g1 = abs(real(f)) + abs(aimag(f))

               if ( f1 - g1 .ge. 0._RP ) then ! |f1| >= |g1|

                    fs = f / f1
                    f2 = real(fs * fs) + aimag(fs * fs)

                    gs = g / f1
                    g2 = real(gs * gs) + aimag(gs * gs)

                    u = sign(1._RP, real(f)) * sqrt(1 + g2 / f2)

                    c = 1 / u
                    s = conjg(gs) * fs * c / f2

               else ! |f1| < |g1|

                    fs = f / g1
                    f2 = real(fs * fs) + aimag(fs * fs)

                    gs = g / g1
                    g2 = real(gs * gs) + aimag(gs * gs)

                    u = sign(1._RP, real(f)) * g1 * sqrt(f2 + g2)

                    f1 = abs(f)
                    fs = f / f1

                    c = f1 / u
                    s = fs * conjg(g) / u

               endif

          endif

     end procedure get_givens_rotation_coefs_loud
     
end submodule get_givens_rotation_coefs_loud_s