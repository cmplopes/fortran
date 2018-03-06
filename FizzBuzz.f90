program FizzBuzz
    implicit none
    character(len=4), dimension(100) :: fizzs = '', buzzs = ''
    integer :: i
    
    where (mod( (/ (i,i=1,100) /), 3) == 0) fizzs = 'Fizz'
    where (mod( (/ (i,i=1,100) /), 5) == 0) buzzs = 'Buzz'

    do i=1, 100
        if (fizzs(i)/='' .or. buzzs(i)/='') then
            print*, trim(fizzs(i))//trim(buzzs(i))
        else
            write(*,'(A,I0)') ' ', i
        end if
    end do
    
end program FizzBuzz
