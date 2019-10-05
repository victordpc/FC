
.global start
.data
A:		.word 0x07
B:		.word 0x0F

.bss
C:		.space 4

.text
start:	LDR R0, =A			@cargamos la direccion de A en r0
		LDR R1, =B			@cargamos la direccion de B en r1
		LDR R5, =C			@Resultado
		MOV R2, #0
		LDR R3, [R0]		@carga r0 en r3
		LDR R4, [R1]		@carga r1 en r4
		CMP R3, R4
		BLT Fin
while:	SUB R3, R3, R4
		ADD R2, R2, #1
		CMP R3, R4
		BGE while
Fin: 	STR R2, [R5]
		B .
		.end

