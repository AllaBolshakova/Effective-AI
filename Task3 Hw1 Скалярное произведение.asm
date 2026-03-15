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

HLT
