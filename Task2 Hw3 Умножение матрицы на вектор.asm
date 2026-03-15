JMP start
m:   DB 2
n:   DB 3
mat: DB 1.0_o3, 2.0_o3, 0.5_o3
     DB 1.5_o3, 1.0_o3, 2.0_o3
vec: DB 2.0_o3, 1.0_o3, 1.5_o3
res: DB 0.0_h, 0.0_h

start:
    MOV A, mat
    MOV B, vec
    MOV C, m
    MOV D, res

    PUSH B
    
.loop2:
    POP B                   
    PUSH B 

    PUSH C
    MOV C, n
    
    FMOV.O3 FQC, 0.0
.loop:
	FMOV.O3 FQA, [A]
    FMOV.O3 FQB, [B]
    FMUL.O3 FQB, FQA
    FADD.O3 FQC, FQB
    DEC C
    INC B
    INC A
    cmp C, 0
    JNZ .loop

    FCVT.H.O3 FHC, FQC
    FMOV.H [D], FHC
    INC D 

    POP C
    DEC C
    CMP C, 0
    JNZ .loop2

HLT
