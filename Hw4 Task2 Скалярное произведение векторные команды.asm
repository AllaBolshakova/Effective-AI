JMP start
vec_a: DB 3, 5, 2, 4, 1
vec_b: DB 4, 1, 6, 2, 3
len:   DB 5

start:
      VSET VL, 5
      VSET VA, {vec_a}, vec_a
      VSET VB, {vec_b}, vec_b
      VMUL.U VA, VA, VB
      Vwait

      VSET VA, vec_a
      VADD.U VC, VA
      VWAIT
      mov A, [0]

    HLT
