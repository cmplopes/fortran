program reduction
    INTEGER I, N
    REAL A(1000000), B(1000000), SUM

    !     Some initializations
    N = 1000000
    DO I = 1, N
        A(I) = I * 1.0
        B(I) = A(I)
    ENDDO
    SUM = 0.0

    !$OMP PARALLEL DO REDUCTION(+:SUM)
    DO I = 1, N
        SUM = SUM + (A(I) * B(I))
    ENDDO

    PRINT *, '   Sum = ', SUM
    return
END
