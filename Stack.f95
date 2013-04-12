!--------------------------------------------------------------------------
!  Header section:
!  TITLE: Stack
!  AUTHOR: Chris Card, Mark Shivers, Branden Whitaker
!  CLASS:  CSCI260A
!  DATE WRITTEN: 3/26/13
!  LAST REVISION: 2/26/13
!  DESCRIPTION: This is a module containing the stack functions and
!				Subroutines
!  VARIABLES USED:
!       NAME:           TYPE:           COMMENT:
!
!--------------------------------------------------------------------------



MODULE Stack



CONTAINS


	SUBROUTINE push(node,stack,last,overflow)
    	INTEGER, INTENT(IN) :: node
    	INTEGER, INTENT(INOUT) :: last, overflow
    	INTEGER, INTENT(INOUT), DIMENSION(:) :: stack
    	
    	IF ( last < SIZE(stack) ) THEN  ! Array not size exceeded
    	   last = last + 1              ! Move to the next position
    	   stack(last) = node           ! Store Node
    	   overflow = 0                 ! All is OK
    	ELSE                            ! Array size will be exceeded
    	   overflow = -2                ! Inform of Overflow
    	END IF

  	END SUBROUTINE push

  	FUNCTION pop(last,underflow, stack)
    	INTEGER, INTENT(INOUT) :: last, underflow
    	INTEGER, INTENT(INOUT), DIMENSION(:) :: stack

    	IF ( last > 0) THEN     ! Lower bound 1
    		pop = stack(last)
    	   	last = last - 1       ! has not been
    	   	underflow = 0         ! violated
    	ELSE                     ! Lower bound is
    	   	underflow = -1        ! violated, warn
    	ENDIF

  	END FUNCTION pop


  	FUNCTION stack_flag(stack,last) RESULT(flag)
    	INTEGER :: last, flag
    	INTEGER, DIMENSION(:) :: stack

    	IF ( last > 0 .AND. last <= SIZE(stack) ) THEN ! Within bounds
    	   flag = 0                                    ! All OK
    	ELSE                                           ! Bounds violated
    	   flag = -3                                   ! Warn
    	ENDIF

  	END FUNCTION stack_flag

END MODULE Stack

	