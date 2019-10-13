submodule ( qr_alg_m ) get_eigenvalues_s ! Подмодуль, содержащий процедуру главного 
                                         ! вызова модифицированного QR-алгоритма для
                                         ! нахождения значений собственных чисел квадратных матриц
implicit none
     
     contains
     
     ! Процедура главного вызова модифицированного QR-алгоритма
     ! для нахождения значений собственных чисел квадратных матриц
     module procedure get_eigenvalues

          integer(JP) :: m, i
          complex(CP) :: sigma

          ! [ Вызов метода Хаусхолдера для преобразования ]
          ! [ исходной матрицы к матрице Хессенберга      ]
          call get_hessenberg_form(input, settings)

          associate( matrix => input%matrix, &
                   &      N => input%N       )

               do m = N, 2, -1

                    repeat : do 

                         sigma = matrix(m, m)

                         do i = 1, m

                              matrix(i, i) = matrix(i, i) - sigma

                         enddo

                         call make_a_hessenberg_qr_step_loud(input, m)

                         do i = 1, m

                              matrix(i, i) = matrix(i, i) + sigma

                         enddo

                    write(*,*) m, matrix(m - 1, m)
                    write(*,'(4(4x, e22.15, 4x, e22.15))') matrix
                    write(*,*)

                    if ( abs(matrix(m - 1, m)) .lt. 1e-10_RP ) then 
                         
                         matrix(m - 1, m) = cmplx(0._RP, 0._RP, kind = CP)
                         exit repeat
                    
                    endif

                    enddo repeat

                    ! write(*,*) m, matrix(m, m)

                    write(*,'(4(4x, e22.15, 4x, e22.15))') matrix
                    write(*,*)

               enddo

               write(*,'(4(4x, e22.15, 4x, e22.15))') matrix
               write(*,*)

          end associate

     end procedure get_eigenvalues
     
end submodule get_eigenvalues_s