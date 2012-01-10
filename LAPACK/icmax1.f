      INTEGER          FUNCTION AR_ICMAX1( N, CX, INCX )
*
*  -- LAPACK auxiliary routine (version 2.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      INTEGER            INCX, N
*     ..
*     .. Array Arguments ..
      COMPLEX            CX( * )
*     ..
*
*  Purpose
*  =======
*
*  AR_ICMAX1 finds the index of the element whose real part has maximum
*  absolute value.
*
*  Based on ICAMAX from Level 1 BLAS.
*  The change is to use the 'genuine' absolute value.
*
*  Contributed by Nick Higham for use with AR_CLACON.
*
*  Arguments
*  =========
*
*  N       (input) INTEGER
*          The number of elements in the vector CX.
*
*  CX      (input) COMPLEX array, dimension (N)
*          The vector whose elements will be summed.
*
*  INCX    (input) INTEGER
*          The spacing between successive values of CX.  INCX >= 1.
*
* =====================================================================
*
*     .. Local Scalars ..
      INTEGER            I, IX
      REAL               SMAX
      COMPLEX            ZDUM
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, REAL
*     ..
*     .. Statement Functions ..
      REAL               CABS1
*     ..
*     .. Statement Function definitions ..
*
*     NEXT LINE IS THE ONLY MODIFICATION.
      CABS1( ZDUM ) = ABS( REAL( ZDUM ) )
*     ..
*     .. Executable Statements ..
*
      AR_ICMAX1 = 0
      IF( N.LT.1 )
     $   RETURN
      AR_ICMAX1 = 1
      IF( N.EQ.1 )
     $   RETURN
      IF( INCX.EQ.1 )
     $   GO TO 30
*
*     CODE FOR INCREMENT NOT EQUAL TO 1
*
      IX = 1
      SMAX = CABS1( CX( 1 ) )
      IX = IX + INCX
      DO 20 I = 2, N
         IF( CABS1( CX( IX ) ).LE.SMAX )
     $      GO TO 10
         AR_ICMAX1 = I
         SMAX = CABS1( CX( IX ) )
   10    CONTINUE
         IX = IX + INCX
   20 CONTINUE
      RETURN
*
*     CODE FOR INCREMENT EQUAL TO 1
*
   30 CONTINUE
      SMAX = CABS1( CX( 1 ) )
      DO 40 I = 2, N
         IF( CABS1( CX( I ) ).LE.SMAX )
     $      GO TO 40
         AR_ICMAX1 = I
         SMAX = CABS1( CX( I ) )
   40 CONTINUE
      RETURN
*
*     End of AR_ICMAX1
*
      END