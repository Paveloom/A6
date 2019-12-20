module read_m ! Модуль с родовой процедурой для считывания данных из файлов
use input_m, only : read_input ! Процедура для считывания входных данных
use settings_m, only : read_settings ! Процедура для считывания настроек программы
implicit none
     
     private
     public :: read ! Процедура для считывания данных из файлов
     
     ! Процедура для считывания данных объектов из файлов
     interface read
     
          module procedure read_input, read_settings
     
     end interface read

end module read_m