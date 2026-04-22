JMP start
data: DB 10, 20, 30, 15, 25
      DB 40, 10, 5, 35, 10
len:  DB 10

start:
      VSET VL, 10
      VSET VA, {data}, data
      VADD.U VC, VA
      mov A, [0]
      vmin.U VA
    HLT
