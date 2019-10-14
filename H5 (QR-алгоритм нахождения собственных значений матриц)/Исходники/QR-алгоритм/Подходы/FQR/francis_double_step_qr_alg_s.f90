submodule ( fqr_m ) francis_double_step_qr_alg_s ! Подмодуль, содержащий процедуру общего 
                                                 ! вызова процедур, реализующих 
                                                 ! QR-алгоритм Фрэнсиса с двойным сдвигом
implicit none
     
     contains
     
     ! Процедура общего вызова процедур, реализующих 
     ! QR-алгоритм Фрэнсиса с двойным сдвигом
     module procedure francis_double_step_qr_alg
          
          logical(LP) :: Q_answer ! Держатель для ответов на вопросы в
                                  ! настройках программы

          ! Показывать реализацию QR-алгоритма Фрэнсиса?
          Q_answer = settings%get_Q3_answer()

          if (Q_answer) then

               ! Показывать реализацию QR-алгоритма Фрэнсиса
               call francis_double_step_qr_alg_loud(input, result, settings)

          else

               ! Не показывать реализацию QR-алгоритма Фрэнсиса
               call francis_double_step_qr_alg_silent(input, result, settings)

          endif
          
     end procedure francis_double_step_qr_alg
     
end submodule francis_double_step_qr_alg_s