	JMP start
x: DB 2.0_h, 3.0_h, 1.5_h
gamma: DB 0.75_h, 0.1_h, 0.5_h
epsilon: DB 0.1_h
len: DB 3
acc:   DB 232

start:
;RMS норма
    MOV A, x
    MOV B, gamma
    MOV C, [len]
    MOV D, [acc]
    push A
    push C

.loop:
	FMOV.h FHA, [A]
    FMUL.h FHA, FHA
    FADD.h FHB, FHA
    DEC C
    INC A
    inc A
    cmp C, 0
    JNZ .loop

POP C
FITOF.h FHC, C
FDIV.h FHB, FHC   
FMOV.h FHC, [epsilon]
FADD.h FHB, FHC
FSQRT.h FHB
FMOV.h FHD, FHB

;Нахождение вектора Y
pop A

.loop2:
	FMOV.h FHA, [A]
    FMOV.h FHB, [B]
    FMUL.h FHB, FHA
    FDIV.h FHB, FHD
    FMOV.h [D], FHB ;Сохраняю результат в память
    DEC C
    INC B
    INC B
    INC A
    INC A
    INC D
    INC D
    cmp C, 0
    JNZ .loop2

    HLT
