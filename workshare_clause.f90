program workshare_clause

use omp_lib
implicit none

	integer :: num_threads = 3
	integer*8, parameter :: m = 100000000
	real*8, dimension(1:m) :: a, b, c
	real*8 :: t1, t2, ept
	
	a = 0.0
	b = 0.0
	c = 0.0
	
	!$ call omp_set_num_threads(num_threads)
	
	call cpu_time(t1)
	
	!$omp parallel
		!$omp workshare
		a = 9.0 ** 2.0
		b = 1.0 ** 2.0
		c = a + b
		!$omp end workshare
	!$omp end parallel
	
	call cpu_time(t2)
	ept = t2 - t1
	!$ ept = ept / num_threads
	
	!$ print*, "OpenMP Mode!!"
	print*, "Execution time = ", ept, "s"

end program workshare_clause
