	ORG 0000h

Loop:	MOV p0, #01H

	ACALL Delay
		
	MOV p0, #0H
	
	ACALL Delay
		
	SJMP Loop 



Delay: 	MOV	R1, #015h
	MOV	R0, #0F4h
	DJNZ	R0, $
	DJNZ	R1, $-4
	RET