P1_4 BIT 094H

ORG 7000H

L1:JNB P1_4,L2
	

CALL 4100H

MOV A,#'N'
ACALL DISPLAY

MOV A,#'O'
ACALL DISPLAY

MOV A,#'B'
ACALL DISPLAY

MOV A,#'O'
ACALL DISPLAY

MOV A,#'T'
ACALL DISPLAY

MOV A,#'T'
ACALL DISPLAY

MOV A,#'L'
ACALL DISPLAY

MOV A,#'E'
ACALL DISPLAY


DISPLAY:

	CLR 90H
	MOV DPTR,#0FFF3H
	MOVX @DPTR,A
	MOV R0,#0
L10:	DJNZ R0,L10
L20:	DJNZ R0,L20
	CLR 91H
	SETB 91H
	RET


L2:JB P1_4,L2

CALL 0000H	
CALL 4100H

MOV A,#'H'
ACALL DISPLAY1

MOV A,#'A'
ACALL DISPLAY1

MOV A,#'s'
ACALL DISPLAY1

MOV A,#'B'
ACALL DISPLAY1

MOV A,#'O'
ACALL DISPLAY1

MOV A,#'T'
ACALL DISPLAY1

MOV A,#'T'
ACALL DISPLAY1

MOV A,#'L'
ACALL DISPLAY1

MOV A,#'E'
ACALL DISPLAY1


DISPLAY1:

	CLR 90H
	MOV DPTR,#0FFF3H
	MOVX @DPTR,A
	MOV R0,#0
LOOP1:	DJNZ R0,LOOP1
LOOP2:	DJNZ R0,LOOP2
	CLR 91H
	SETB 91H
	RET


MOV	R3, #006h
	MOV	R2, #0B1h
	MOV	R1, #00Ah
	MOV	R0, #0F1h
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	DJNZ	R2, $-9
	DJNZ	R3, $-13
	MOV	R1, #005h
	MOV	R0, #0D4h
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	NOP


CALL 0000H	
CALL 4100H

MOV A,#'B'
ACALL DISPLAY1

MOV A,#'O'
ACALL DISPLAY1

MOV A,#'T'
ACALL DISPLAY1

MOV A,#'T'
ACALL DISPLAY1

MOV A,#'L'
ACALL DISPLAY1

MOV A,#'E'
ACALL DISPLAY1


MOV A,#'F'
ACALL DISPLAY1

MOV A,#'I'
ACALL DISPLAY1

MOV A,#'L'
ACALL DISPLAY1

MOV A,#'L'
ACALL DISPLAY1


DISPLAY1:

	CLR 90H
	MOV DPTR,#0FFF3H
	MOVX @DPTR,A
	MOV R0,#0
LOOP1:	DJNZ R0,LOOP1
LOOP2:	DJNZ R0,LOOP2
	CLR 91H
	SETB 91H
	RET

CALL 0000H

LJMP L1


END