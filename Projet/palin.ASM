	LOADDIADRSI
boucle  INCSI
	LOADBADRDI
	LOADAADRSI 
	CMPBA
	JMPNZ notpalin
	DECDI
	JMPPZ try
	jmp palin
try	LOADADI
	CMPSIA
	JMPPZ palin
	jmp boucle 
palin	LOADA #1
	JMP fin
notpalin	LOADA #-1
fin	jmp fin 