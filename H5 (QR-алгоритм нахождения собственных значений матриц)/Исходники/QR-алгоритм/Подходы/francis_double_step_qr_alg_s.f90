submodule ( qr_alg_m ) francis_double_step_qr_alg_s ! Подмодуль, содержащий процедуру,
                                                    ! реализующую QR-алгоритм Фрэнсиса
                                                    ! с двойным сдвигом
implicit none
     
     contains
     
     ! Процедура, реализующая QR-алгоритм Фрэнсиса с двойным сдвигом
     module procedure francis_double_step_qr_alg

          real(RP), dimension(input%N, input%N) :: rmatrix
          
          integer(JP) :: p, q, k, r
          real(RP) :: s, t, x, y, z
          real(RP), dimension(1, 3) :: u

          real(RP), dimension(3, 3) :: PH ! Рефлектор
          real(RP), dimension(2, 2) :: PR ! Матрица вращения

          ! Вещественные части некоторых элементов матрицы
          real(RP) :: mqq, mpp, mpq, mqp, m11, m21, m12, m22, m23
          
          associate ( matrix => input%matrix, & ! Матрица объекта
                    &      N => input%N       ) ! Число строк матрицы

               rmatrix = real(matrix)

               p = int(N, kind = JP)

               do while ( p .gt. 2_JP )

                    q = p - 1_JP

                    m11 = rmatrix(1, 1)
                    m21 = rmatrix(2, 1)
                    m12 = rmatrix(1, 2)
                    m22 = rmatrix(2, 2)
                    m23 = rmatrix(2, 3)

                    mqq = rmatrix(q, q)
                    mpp = rmatrix(p, p)
                    mpq = rmatrix(p, q)
                    mqp = rmatrix(q, p)

                    s = mqq + mpp
                    t = mqq * mpp - mpq * mqp

                    x = m11 ** 2 + m21 * m12 - s * m11 + t
                    y = m12 * (m11 + m22 - s)
                    z = m12 * m23

                    do k = 0_JP, p - 3_JP

                         PH = determine_the_reflector([x, y, z])

                         r = max(1_JP, k)

                         rmatrix(r:n, k + 1:k + 3) = matmul(rmatrix(r:n, k + 1:k + 3), transpose(PH))

                         r = min(k + 4_JP, p)

                         rmatrix(k + 1:k + 3, 1:r) = matmul(PH, rmatrix(k + 1:k + 3, 1:r))

                         x = rmatrix(k + 1, k + 2)
                         y = rmatrix(k + 1, k + 3)

                         if ( k .lt. p - 3_JP ) then

                              z = rmatrix(k + 1, k + 4)

                         endif

                    enddo

                    PR = get_givens_rotation_matrix(x, y)

                    rmatrix(p - 2:N, q:p) = matmul( rmatrix(p - 2:N, q:p), transpose(PR) )
                    rmatrix(p - 1:p, 1:p) = matmul( PR, rmatrix(p - 1:p, 1:p) )

                    if ( abs(rmatrix(q, p)) .lt. ( 1e-10_RP * ( abs(rmatrix(q, q)) + abs(rmatrix(p, p)) ) ) ) then

                         rmatrix(q, p) = 0._RP
                         p = p - 1_JP
                         q = p - 1_JP

                    elseif ( abs(rmatrix(q - 1, p - 1)) .lt. 1e-10_RP * ( abs(rmatrix(q - 1, q - 1)) + abs(rmatrix(q, q)) ) ) then

                         rmatrix(q - 1, p - 1) = 0._RP
                         p = p - 2_JP
                         q = p - 1_JP

                    endif

               enddo

               write(*,'(4(4x, e22.15))') rmatrix
               write(*,*)

          end associate
          
     end procedure francis_double_step_qr_alg
     
end submodule francis_double_step_qr_alg_s