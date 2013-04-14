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
USE Stack

IMPLICIT NONE


!Var Dec
INTEGER, DIMENSION(30)::stack
CHARACTER(len=1)::input
CHARACTER(len=30)::toParse
INTEGER::toStack


!Begin program






CONTAINS

INTEGER FUNCTION toINT(line)
	CHARACTER(len=30),INTENT(IN)::line
	INTEGER::size,currPower,i,ret

	size = LEN(TRIM(line))
	currPower = 10**(size-1)
	ret = 0

	DO i=0,LEN(TRIM(line))
		ret = currPower*()

	END DO


END FUNCTION

INTEGER FUNCTION getint(char)
	CHARACTER(len=1)::char

	IF(char .EQ. '0') THEN
		getint = 0

	ELSE IF(char .EQ. '1') THEN
		getint = 1

	ELSE IF(char .EQ. '2') THEN
		getint = 2

	ELSE IF(char .EQ. '3') THEN
		getint = 3

	ELSE IF(char .EQ. '4') THEN
		getint = 4

	ELSE IF(char .EQ. '5') THEN
		getint = 5

	ELSE IF(char .EQ. '6') THEN
		getint = 6

	ELSE IF(char .EQ. '7') THEN
		getint = 7

	ELSE IF(char .EQ. '8') THEN
		getint = 8

	ELSE IF(char .EQ. '9') THEN
		getint = 9
	END IF
END FUNCTION

END PROGRAM