.DATA  
	a	QWORD ?
	b	QWORD ?

.CODE
	ppcm PROC

			MOV AX,CX
			MOV BX,DX
			
Bouclexterne:	

			CMP AX,BX
			JE fin

boucleinterne:
			
			CMP AX,BX
			JAE Boucle2interne
			ADD AX,CX
			JMP Boucleinterne

Boucle2interne:
			
			CMP AX,BX
			JBE Bouclexterne
			ADD BX,DX
			JMP Boucle2interne
			
			

fin:			RET

	ppcm ENDP

END 