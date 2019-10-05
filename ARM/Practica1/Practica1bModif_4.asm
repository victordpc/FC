
.global start
.data
A:		.word 0x11	@17
B:		.word 0x08	@8

.bss
C:		.space 4
resto:	.space 4
.text
start:	LDR R0, =A				@cargamos la direccion de A en r0
		LDR R1, =B				@cargamos la direccion de B en r1
		LDR R3, [R0]			@carga A en r3
		LDR R4, [R1]			@carga B en r4
		MOV R2, #0
		CMP R3, R4
		BLT seguir
		MOV R1, R3
		MOV R3, R4
		MOV R4, R1




seguir:	LDR R5, =C				@R5 -> cociente
		LDR R6, =resto			@R6 -> resto

while:	SUB R4, R4, R3
		ADD R2, R2, #1
		CMP R4, R3
		BGE while
Fin: 	STR R2, [R5]
		STR R4, [R6]
		B .
		.end

