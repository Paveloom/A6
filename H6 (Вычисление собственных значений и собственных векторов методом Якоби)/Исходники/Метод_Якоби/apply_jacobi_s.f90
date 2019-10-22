submodule ( jacobi_m ) apply_jacobi_s ! Подмодуль, содержащий процедуру, реализующую
                                             ! метод Якоби для поиска собственных значений и
                                             ! векторов симметричных матриц
implicit none
     
     contains
     
     ! Процедура, реализующая метод Якоби для поиска
     ! собственных значений и векторов симметричных матриц
     module procedure apply_jacobi
          
          ! Проверка, является ли матрица симметричной
          call test_if_the_matrix_is_symmetric(input)
          
     end procedure apply_jacobi
     
end submodule apply_jacobi_s