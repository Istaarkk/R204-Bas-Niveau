.CODE
	factorielle PROC

			MOV RAX,1
			CMP RCX,0
			JE fin
start:		MUL RCX
			DEC RCX
			CMP RCX,1
			JNE start


fin:			RET

	factorielle ENDP

END 