module rand ! Модуль для получения случайного сида
implicit none

     private
     public :: init_random_seed

     contains

     subroutine init_random_seed()

          integer(4) :: i, n, clock
          integer(4), dimension(:), allocatable :: seed

          call random_seed( size = n )
          allocate(seed(n))

          call system_clock( count = clock )

          seed = clock + 37 * (/ (i - 1, i = 1, n) /)
          call random_seed( put = seed )

          deallocate(seed)

     end subroutine init_random_seed

end module rand