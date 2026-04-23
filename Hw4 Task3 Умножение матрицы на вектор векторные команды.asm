JMP start
m:   DB 2, 0
n:   DB 3, 0
mat: DB 1.0_o3, 2.0_o3, 0.5_o3
     DB 1.5_o3, 1.0_o3, 2.0_o3
vec: DB 2.0_o3, 1.0_o3, 1.5_o3
res: DB 0.0_h, 0.0_h

start:
    MOV A, mat
    MOV B, vec
    MOV C, m
    MOV D, 0


    VSET VA, {mat}, mat
    VSET VB, {vec}, vec
    
    .loop:
      push C
      
      MOV C, 3
      VSET VL, D, C
      VSET VB, D, B
      VMUL.o3 VA, VA, VB
      VWAIT

      POP C

      dec C
      cmp C, 0
      JNZ .loop

    MOV C, m
    VSET VA, mat

    .loop2:
      VADD.o3 VC, VA
      VWAIT
  
      dec C
      cmp C, 0
      JNZ .loop2

    HLT
