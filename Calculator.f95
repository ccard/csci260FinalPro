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

END FUNCTION

END PROGRAM