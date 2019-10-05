
.global start
.data
X: .word 0x05, 0x01, 0x04, 0x05, 0x08, 0x09, 0x09, 0x01 	@ 51458991
Y: .word 0x01, 0x09, 0x09, 0x08, 0x05, 0x04, 0x01, 0x05		@ 19985415

.bss
Mayor: .space 32
.text
start:
			LDR R4, =X
			LDR R3, =Y
			LDR R5, =Mayor		@Resultado
			MOV R6, #8			@i
vector:		LDR R1, [R4]
			LDR R2, [R3]
			CMP R1, R2
			BGE else
			STR R1, [R5]
			B for
else: 		STR R2, [R5]
for:		ADD R5, R5, #4		@Incrementamos los punteros
			ADD R4, R4, #4
			ADD R3, R3, #4
			SUB R6, R6, #1		@Decrementamos contador i
			CMP R6, #0
			BNE vector
FIN: 		B .
			.end

