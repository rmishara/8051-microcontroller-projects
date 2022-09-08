	ORG 0000h

Loop:	MOV p0,#01H
	
	ACALL Delay
	
	MOV p0,#0H
	
	ACALL Delay
	
	SJMP Loop



Delay:  	MOV TMOD,#00001000B
	
	MOV TL1,#0A3H	
	MOV TH1,#0D7H	
	SETB TR1

L1:	JNB TF1 , L1
	
	CLR TR1
	
	CLR TF1
	
	RET