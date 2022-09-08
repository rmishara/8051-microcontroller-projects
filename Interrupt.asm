B DATA 0F0H

ORG 7000H

MAIN:	
	CALL 4100H
	SETB 93H
     	MOV DPTR,#0FFF7H
     	MOVX @DPTR,A
     	JB 93H,$
     	MOVX A,@DPTR

DISPLAY:
	MOV B,#100
     	DIV AB
     	ACALL LCD
     	
     	MOV A,B
     	MOV B,#10
     	DIV AB     	
     	ACALL LCD
     
     	MOV A,B
     	ACALL LCD

     	ACALL DELAY
     	CALL 4100H
     	SJMP MAIN

LCD: 	
	ADD A,#48
	CLR 90H
      	MOV DPTR,#0FFF3H
      	MOVX@DPTR,A
      	MOV R0,#0
      	DJNZ R0,$
      	DJNZ R0,$
      	CLR 91H
      	SETB 91H
      RET

DELAY:			;DELAY TIME:20 mS
	MOV R0,#250
   	L1:MOV R1,#35
   	L2:DJNZ R1,L2
   	DJNZ R0,L1
	RET
END

	