MODULE art
CONTAINS
SUBROUTINE answeroftheuniverse()
	IMPLICIT NONE
	
	INTEGER::err
	CHARACTER(len=110)::input
	
	OPEN (unit=44,File = "Answer_to_42.txt", status="old", action='READ', IOSTAT = err)
	
	IF(err /= 0) THEN
		WRITE(*,*) "Failed to open the Answer_to_42.txt file"
		
	ELSE
	
		DO
			READ(44,55,IOSTAT = err) input
			55 FORMAT(A110)

			IF(err /= 0) THEN
				EXIT
			END IF
			
			WRITE(*,*) input
		END DO

		CLOSE(44)
	END IF
END SUBROUTINE

SUBROUTINE three_musketeers()
	IMPLICIT NONE

	INTEGER::err
	CHARACTER(len=34)::input

	OPEN(unit=44, File = "answer_to_3.txt", status="old", action='READ', IOSTAT = err)

	IF(err /= 0) THEN
		WRITE(*,*) "Failed to open the file: answer_to_3.txt"
	ELSE

		DO
			READ(44,55,IOSTAT = err) input
			55 FORMAT(A34)

			IF(err /= 0) THEN
				EXIT
			END IF

			WRITE(*,*) input
		END DO

		CLOSE(44)
	END IF
END SUBROUTINE

SUBROUTINE calvin_and_hobbes()
	IMPLICIT NONE

	INTEGER::err
	CHARACTER(len=69)::input

	OPEN(unit=44, File = "answer_to_7.txt", status="old", action='READ', IOSTAT = err)

	IF(err /= 0) THEN
		WRITE(*,*) "Failed to open the file: answer_to_7.txt"
	ELSE

		DO
			READ(44,55,IOSTAT = err) input
			55 FORMAT(A69)

			IF(err /= 0) THEN
				EXIT
			END IF

			WRITE(*,*) input
		END DO

		CLOSE(44)
	END IF
END SUBROUTINE


END MODULE
