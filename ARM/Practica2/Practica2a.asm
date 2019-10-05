/*51458991-X*/
.global start

.equ N, 8

.data
A: .word 7, 3, 25, 4, 75, 2, 1, 1

.bss
max: .space 4

.text
start:
		MOV R0, #0
		LDR R1, =max		/*	R1 Mem MAX	*/
		STR R0, [R1]		/*	R0 Val MAX	*/
		LDR R3, =A
		@LDR R3, [R3]		/*	R3 A	*/
		MOV R2, #N			/*	R2 i=N	*/
for:	CMP R2, #0			/*	Comparamos para ver si salimos del bucle	*/
		BEQ	FIN				/*	BEQ #0	*/
		SUB R2, #1			/*	i--	*/
		LDR R4, [R3, R2, LSL#2] /*	Cargamos en R4 el valor almacenado en R0(A)+R2(i)*4	*/
								/*	Recorremos el array de fin a principio	*/
		CMP R0, R4			/*	Comparamos R0(MAX) R4(A[i])	*/
		BGT seguir			/*	Si R0 > R4 No guardamos	*/
		MOV R0, R4
		STR R0, [R1]		/*	Actualizamos MAX con el valor máximo	*/
seguir:
		B for
FIN: 	B .
		.end
