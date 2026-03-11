 JMP start

data:
	DB 10, 20, 30, 15, 25
len:
	DB 5
start:
	MOV A, 0      ; сумма
	MOV B, data   ; указатель
	MOV C, [len]  ; счётчик

.loop:  MOV D, [B]
        ADD A, D
        DEC C
        INC B
	CMP C, 0	; Check if end
	JNZ .loop	; jump if not

    ; печать в консоль
        mov D, 231
        push A
.loop1:
        div 10
        inc D
        cmp A, 0
        JNZ .loop1
        
        pop A
.loop2:     
        mov B, A
        DIV 10 ; А div 10
        MUL 10 ; А*10
        sub B, A
        add B, 48
        mov [D], B
        dec D
        DIV 10 ; A div 10
        cmp A, 0
        JNZ .loop2
	HLT
