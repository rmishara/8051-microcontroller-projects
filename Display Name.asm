ORG 0000H
MOV A,#'I'
ACALL Display
MOV A,#'S'
ACALL Display
MOV A,#'H'
ACALL Display
MOV A,#'A'
ACALL Display
MOV A,#'R'
ACALL Display
MOV A,#'A'
ACALL Display

Display:	MOV P1,A
	SETB P3.5
	CLR P3.4
	SETB P3.3
	CLR P3.3
	MOV R3,#0
	DJNZ R3,$
	DJNZ R3,$
	CLR P3.3
	SETB P3.3
	RET
	END