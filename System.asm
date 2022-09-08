// Here the motor is Starts after Port 3 pin 2 is switched. 
//The signel goes to a Electric switch, then ignites high tention current. 
//Manual switch is assumed as bounce back switch. 
//After 20m the motor is automatically turne off. 
//20m is the time taken to fill the tank.

ORG 0000H

	JB P3.2,$   ; Switch Control
START: 	SETB P0.1
	ACALL DELAY
	CLR P0.1
	CLR P3.2
	RET


DELAY:	MOV	R5, #017h    ; 20m time delay
	MOV	R4, #04Ah
	MOV	R3, #0A6h
	MOV	R2, #003h
	MOV	R1, #0E4h
	MOV	R0, #000h
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	DJNZ	R2, $-9
	DJNZ	R3, $-13
	DJNZ	R4, $-17
	DJNZ	R5, $-21
	MOV	R6, #005h
	MOV	R5, #0C2h
	MOV	R4, #006h
	MOV	R3, #006h
	MOV	R2, #022h
	MOV	R1, #020h
	MOV	R0, #004h
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	DJNZ	R2, $-9
	DJNZ	R3, $-13
	DJNZ	R4, $-17
	DJNZ	R5, $-21
	DJNZ	R6, $-25
	MOV	R3, #00Ah
	MOV	R2, #0EDh
	MOV	R1, #01Dh
	MOV	R0, #01Bh
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	DJNZ	R2, $-9
	DJNZ	R3, $-13
	MOV	R1, #002h
	MOV	R0, #0DFh
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	RET
END

