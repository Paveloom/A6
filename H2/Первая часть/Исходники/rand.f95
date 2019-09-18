module rand ! Модуль с процедурой для получения случайного сида
implicit none

     private
     public :: init_random_seed

     contains

     ! Процедура, обновляющая сид для генератора случайных чисел
     subroutine init_random_seed()

          integer(4) :: n ! Размер сида
          integer(4) :: clock ! Штамп времени
          integer(4), dimension(:), allocatable :: seed ! Сид

          call random_seed( size = n )
          allocate(seed(n))

          call system_clock( count = clock )

          seed = clock
          call random_seed( put = seed )

          deallocate(seed)

     end subroutine init_random_seed

end module rand