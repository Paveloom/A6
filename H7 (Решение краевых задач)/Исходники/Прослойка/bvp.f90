module bvp ! Модуль для решения краевых задач
use input_m, only : input_type ! Тип входных данных
use settings_m, only : settings_type ! Тип настроек программы
use read_m, only : read ! Родовая процедура для считывания данных из файлов
use result_m, only : result_type, & ! Тип результата
                   & allocate_result, & ! Процедура для выделения памяти под массивы результата
                   & deallocate => deallocate_result ! Процедура для освобождения памяти из-под результата
use bvp_solver_m, only : solve_bvp ! Процедура общего вызова для получения решения
end module bvp