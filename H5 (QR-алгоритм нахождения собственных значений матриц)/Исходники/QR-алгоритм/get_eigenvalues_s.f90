submodule ( qr_alg_m ) get_eigenvalues_s ! Подмодуль, содержащий процедуру главного 
                                         ! вызова модифицированного QR-алгоритма для
                                         ! нахождения значений собственных чисел квадратных матриц
implicit none
     
     contains
     
     ! Процедура главного вызова модифицированного QR-алгоритма
     ! для нахождения значений собственных чисел квадратных матриц
     module procedure get_eigenvalues

          ! [ Вызов метода Хаусхолдера для преобразования ]
          ! [ исходной матрицы к матрице Хессенберга      ]
          call get_hessenberg_form(input, settings)

          ! [ Вызов QR-алгоритма Хаусхолдера со ]
          ! [ сдвигом по отношению Релея        ]
          !call hqr_alg_with_rayleigh_quotient_shift(input, settings)

          ! [ Вызов QR-алгоритма Фрэнсиса с двойным сдвигом ]
          call francis_double_step_qr_alg(input, result, settings)

          ! write(*,'(3(4x, e22.15))') real(input%matrix)
          ! write(*,*)

     end procedure get_eigenvalues
     
end submodule get_eigenvalues_s