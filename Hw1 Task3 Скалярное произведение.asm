	JMP start
vec_a:
	DB 3, 5, 2
vec_b:
	DB 4, 1, 6
len:
	DB 3
start:
    MOV D, 0
	MOV C, 0    ; индекс

.loop:
    MOV A, vec_a
    ADD A, C      
    MOV A, [A]
    
    MOV B, vec_b
    ADD B, C      
    MOV B, [B]
    
    MUL B
    ADD D, A
    INC C

    CMP C, [len]
    JNZ .loop

    MOV A, D
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
