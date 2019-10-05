
.global start
.data
A:		.word 0x08	@8
B:		.word 0x11	@17

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
		BGT Fin


		LDR R5, =C				@R5 -> cociente
		LDR R6, =resto			@R6 -> resto

while:	SUB R4, R4, R3
		ADD R2, R2, #1
		CMP R4, R3
		BGE while
Fin: 	STR R2, [R5]
		STR R4, [R6]
		B .
		.end

