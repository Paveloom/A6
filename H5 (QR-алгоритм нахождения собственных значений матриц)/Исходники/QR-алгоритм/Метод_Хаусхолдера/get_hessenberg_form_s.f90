submodule ( householder_reduction_m ) get_hessenberg_form_s ! Процедура для общего вызова процедуры, реализующей
                                                            ! метод Хаусхолдера для приведения исходной матрицы к 
                                                            ! матрице Хессенберга (почти треугольной матрице)
implicit none
     
     contains
     
     ! Процедура для общего вызова процедуры, реализующей
     ! метод Хаусхолдера для приведения исходной матрицы к 
     ! матрице Хессенберга (почти треугольной матрице)
     module procedure get_hessenberg_form
          
          logical(LP) :: Q_answer ! Держатель для ответов на вопросы в
                                  ! настройках программы

          ! Показывать реализацию метода Хаусхолдера?
          Q_answer = settings%get_Q1_answer()

          if (Q_answer) then 
               
               ! Показывать реализацию метода Хаусхолдера
               call get_hessenberg_form_loud(input)
          
          else

               ! Не показывать реализацию метода Хаусхолдера
               call get_hessenberg_form_silent(input)

          endif

     end procedure get_hessenberg_form
     
end submodule get_hessenberg_form_s