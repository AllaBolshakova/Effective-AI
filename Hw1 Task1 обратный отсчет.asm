start:
	MOV C, 53    ; Point to var
	MOV D, 232	; Point to output
	CALL print
        HLT             ; Stop execution

print:			; print(C:*from, D:*to)
	
.loop:
	MOV [D], C	; Write to output
	DEC C
	INC D  
	CMP C, 47	; Check if end
	JNZ .loop	; jump if not


	RET
