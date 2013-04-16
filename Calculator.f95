!--------------------------------------------------------------------------
!  Header section:
!  TITLE: Stack
!  AUTHOR: Chris Card, Mark Shivers, Branden Whitaker
!  CLASS:  CSCI260A
!  DATE WRITTEN: 4/12/13
!  LAST REVISION: 4/12/13
!  DESCRIPTION: This is the main program
!  VARIABLES USED:
!       NAME:           TYPE:           COMMENT:
!
!--------------------------------------------------------------------------


PROGRAM Calculator
!USE Stack

IMPLICIT NONE


!Var Dec
INTEGER, DIMENSION(30)::stack
CHARACTER(len=1)::input
CHARACTER(len=30)::toParse
INTEGER::toStack


!Begin program

!testing to see if my functions are working
WRITE(*,*) "type integer or an operator and hit enter( to evaluate the inputed expression type =)"
READ(*,*) toParse

toStack = toINT(toParse)

WRITE(*,*) toStack+1

CONTAINS

INTEGER FUNCTION toINT(line)
	CHARACTER(len=30),INTENT(IN)::line
	INTEGER::size,currPower,i,ret,negate,hasNeg
	CHARACTER(len=1)::char

	size = LEN(TRIM(line))
	currPower = 10**(size-1)
	ret = 0
	negate = 1
	hasNeg = 1

	DO i=1,size
		char = line(i:i)
		IF (char .EQ. '-') THEN
			negate = -1
			hasNeg = 2
			currPower = 10**(size-hasNeg)
		ELSE
			ret = ret + (currPower*getint(char))
	
			IF (i .NE. (size-1)) THEN
				currPower = 10**((size-hasNeg)-i)
			ELSE
				currPower = 1
			END IF
		END IF
	END DO

	toINT = ret*negate
END FUNCTION

INTEGER FUNCTION getint(char)
	CHARACTER(len=1), INTENT(IN)::char
	INTEGER::ret

	ret = -1
	IF(char .EQ. '0') THEN
		ret = 0

	ELSE IF(char .EQ. '1') THEN
		ret = 1

	ELSE IF(char .EQ. '2') THEN
		ret = 2

	ELSE IF(char .EQ. '3') THEN
		ret = 3

	ELSE IF(char .EQ. '4') THEN
		ret = 4

	ELSE IF(char .EQ. '5') THEN
		ret = 5

	ELSE IF(char .EQ. '6') THEN
		ret = 6

	ELSE IF(char .EQ. '7') THEN
		ret = 7

	ELSE IF(char .EQ. '8') THEN
		ret = 8

	ELSE IF(char .EQ. '9') THEN
		ret = 9
	END IF

	getint = ret

END FUNCTION

END PROGRAM