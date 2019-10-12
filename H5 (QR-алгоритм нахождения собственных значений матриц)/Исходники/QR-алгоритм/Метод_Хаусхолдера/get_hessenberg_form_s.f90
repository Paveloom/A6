submodule ( householder_reduction_m ) get_hessenberg_form_s ! Процедура для общего вызова процедуры, реализующей
                                                            ! метод Хаусхолдера для приведения исходной матрицы к 
                                                            ! матрице Хессенберга (почти треугольной матрице)
implicit none
     
     contains
     
     ! Процедура для общего вызова процедуры, реализующей
     ! метод Хаусхолдера для приведения исходной матрицы к 
     ! матрице Хессенберга (почти треугольной матрице)
     module procedure get_hessenberg_form
          
          call get_hessenberg_form_loud(input)
          
     end procedure get_hessenberg_form
     
end submodule get_hessenberg_form_s