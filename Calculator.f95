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
!		thestack 		INTEGER 		This is the stack that stores the results
!										for the operations	
!		toParse 		CHARACTER 		The input from the user
! 		toStack 		INTEGER 		The conversion of user input to int
!										to be put onto the stack
!		size 			INTEGER 		The size of the inputed strig
!		right 			INTEGER 		The right side of the equation
!		left 			INTEGER 		The left side of the equation
! 		overunderflow 	INTEGER 		This reports if we have gone over thestack
!										the stack size or below 0
!		last 			INTEGER 		This stores the location of the last
!										element on the stack
!--------------------------------------------------------------------------


PROGRAM Calculator
USE Stack
!USE art

IMPLICIT NONE


!Var Dec
INTEGER, DIMENSION(30)::thestack
CHARACTER(len=30)::toParse
INTEGER::toStack,size,right,left,overunderflow,last


!Begin program

!testing to see if my functions are working
WRITE(*,*) "Type integer or an operator and hit enter(q to quite,d to divide)"

last = 0

DO
	READ(*,*) toParse
	size = LEN(TRIM(toParse))
	IF (size .EQ. 1) THEN

		IF (isSymbol((TRIM(toParse)))) THEN

			right = pop(last,overunderflow,thestack)

			IF (overunderflow .EQ. -1) THEN
				WRITE(*,*) "underflow of stack"
				EXIT
			END IF

			left = pop(last,overunderflow,thestack)

			IF (overunderflow .EQ. -1) THEN
				WRITE(*,*) "underflow of stack"
				EXIT
			END IF

			IF (TRIM(toParse) .EQ. '*') THEN
				left = left*right
			ELSE IF (TRIM(toParse) .EQ. 'd') THEN
				left = left/right
			ELSE IF (TRIM(toParse) .EQ. '+') THEN
				left = left+right
			ELSE IF (TRIM(toParse) .EQ. '-') THEN
				left = left-right
			END IF

			CALL push(left,thestack,last,overunderflow)

			IF (overunderflow .EQ. -2) THEN
				WRITE(*,*) "stack overflow error"
				EXIT
			END IF

			WRITE(*,*) left

			IF (left .EQ. 42) THEN
			  !CALL answeroftheuniverse()
			  WRITE(*,*) "The answer to life"
			END IF

		ELSE
			IF (TRIM(toParse) .EQ. 'q') THEN
				EXIT
			END IF

			CALL push(toINT(toParse),thestack,last,overunderflow)

			IF (overunderflow .EQ. -2) THEN
				WRITE(*,*) "stack overflow error"
				EXIT
			END IF
		END IF


	ELSE
		toStack = toINT(toParse)

		CALL push(toStack,thestack,last,overunderflow)
		
		IF (overunderflow .EQ. -2) THEN
			WRITE(*,*) "stack overflow error"
			EXIT
		END IF
	END IF

END DO

CONTAINS

LOGICAL FUNCTION isSymbol(line)
	CHARACTER(len=1), INTENT(IN)::line
	LOGICAL::ret

	ret = .FALSE.

	IF (line .EQ. '*') THEN
		ret = .TRUE.
	ELSE IF (line .EQ. 'd') THEN
		ret = .TRUE.
	ELSE IF (line .EQ. '+') THEN
		ret = .TRUE.
	ELSE IF (line .EQ. '-') THEN
		ret = .TRUE.
	END IF

	isSymbol = ret

END FUNCTION

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