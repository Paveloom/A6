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

          call make_a_hessenberg_qr_step_loud(input)

     end procedure get_eigenvalues
     
end submodule get_eigenvalues_s