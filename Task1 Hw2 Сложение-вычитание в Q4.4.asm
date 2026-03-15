; Q4.4: a = 2.5 (0x28), b = 1.25 (0x14)
JMP start

a_val:
	DB 0x28
b_val:
	DB 0x14

start:
	MOV A, [a_val]
	MOV B, [b_val]

; Сложение
    MOV C, A
    ADD C, B

 ; Вычитание
    MOV D, A
    SUB D, B

    push C
    push D
	; ваш код здесь
	; 1) получить c = a + b
	; 2) получить d = a - b
	; 3) сохранить c и d в память

	HLT
