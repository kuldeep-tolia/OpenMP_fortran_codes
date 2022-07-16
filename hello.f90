program hello_world

use omp_lib
implicit none

	integer :: num_threads = 4
	integer :: id = 0
	!$ call omp_set_num_threads(num_threads)
	print*, "Number of threads used = ", num_threads
	print*, "---------------------------------------"
	
	!$omp parallel private(id) 
		id = omp_get_thread_num()
		print*, "Hello from thread id = ", id
	!$omp end parallel	

end program hello_world
