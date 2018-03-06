program  WORKSHARE1

    INTEGER NTHREADS, TID, OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM, N, I
    PARAMETER (N = 10000)
    REAL A(N), B(N), C(N)

    ! Some initializations
    CALL OMP_SET_NUM_THREADS(4)

    !$OMP parallel do private (I) shared(A)   
    DO I = 1, N
        A(I) = I
    ENDDO
    !$OMP end parallel do
    
    B = A

    !$OMP PARALLEL SHARED(A,B,C) PRIVATE(I,TID)

    TID = OMP_GET_THREAD_NUM()
    IF (TID .EQ. 0) THEN
        NTHREADS = OMP_GET_NUM_THREADS()
        PRINT *, 'Number of threads =', NTHREADS
    END IF
    PRINT *, 'Thread', TID, ' starting...'

    !$OMP DO 
    DO I = 1, N
        C(I) = A(I) + B(I)
        WRITE(*, 100) TID, I, C(I)
        100 FORMAT(' Thread', I2, ': C(', I3, ')=', F8.2)
    ENDDO
    !$OMP END DO NOWAIT

    PRINT *, 'Thread', TID, ' done.'

    !$OMP END PARALLEL

    return
END 
