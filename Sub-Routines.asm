	B DATA 0F0H
	TMOD DATA 89H
	TH0 DATA 8CH
	TL0 DATA 8AH
   	TF0 BIT 8DH
   	TR0 BIT 8CH   	
   	IE DATA 0A8H
   	P1_4 BIT 94H

   ORG 4003H

    	LCALL INTERRUPT
	LJMP START
	
    	
   ORG 7000H
	
		MOV IE,#10000001B	  
		MOV TMOD,#00000110B
		MOV TH0,#245
		MOV TL0,#245 
  		
	START:	SETB TR0

	MAIN:	
		ACALL DISPLAY
		ACALL DELAY1
		JNB TF0,MAIN		
		CLR TF0
		CLR TR0
		ACALL FULL
		ACALL DELAY2
		SJMP START
	

	DISPLAY:
		CALL 4100H
		MOV A,TL0
		SUBB A,#245		
		
		MOV B,#10
		DIV AB
		ADD A,#48
		ACALL LCD

		MOV A,B
		ADD A,#48
		ACALL LCD
		RET


	LCD:	
		CLR 90H
		MOV DPTR,#0FFF3H
		MOVX @DPTR,A
		MOV R0,#0H
		DJNZ R0,$      ;DELAY TIME:1.020 mS
		DJNZ R0,$
		CLR 91H
		SETB 91H
		RET

	DELAY1:			;DELAY TIME:20 mS
		   MOV R1,#255
		L1:MOV R2,#35
		L2:DJNZ R2,L2
		   DJNZ R1,L1
		RET

	DELAY2:                 ;DELAY TIME:1 S
		   MOV R3,#255
		L3:MOV R4,#255
		L4:MOV R5,#5
		L5:DJNZ R5,L5
		   DJNZ R4,L4
		   DJNZ R3,L3
		   RET

	DELAY3:                 ;DELAY TIME:10 S
		   MOV R3,#255
		L6:MOV R4,#255
		L7:MOV R5,#70
		L8:DJNZ R5,L8
		   DJNZ R4,L7
		   DJNZ R3,L6
		   RET
	FULL:
		CALL 4100H
		MOV A,#'F'
		ACALL LCD
		MOV A,#'U'
		ACALL LCD
		MOV A,#'L'
		ACALL LCD
		MOV A,#'L'
		ACALL LCD
		RET
		

	INTERRUPT:
		CLR P1_4
		CLR TR0
		ACALL DELAY3
		SETB P1_4
		RETI
		
END
		

		
 

