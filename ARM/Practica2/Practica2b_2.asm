/*51458991-X*/
.global start

.equ N, 8

.data
A: .word 7, 3, 25, 4, 75, 2, 1, 1

.bss
B:	 .space N*4

.text
start:

		LDR R4, =A
		LDR R3, =B

		MOV R2, #0
forCopia:
		CMP R2, #N
		BEQ finCopia

		LDR R5, [R4, R2, LSL #2]	/*	Cargamos en R5 A[i] 	*/
		STR R5, [R3, R2, LSL #2]	/*	Guardamos R6 en B[i]	*/

		ADD R2, #1
		B forCopia

finCopia:

		MOV R2,#0			/*	Limpiamos los registros usados	*/
		MOV R3,#0
		MOV R4,#0
		MOV R5,#0

		LDR R4, =A			/*	R4 A	*/
	/*	R0 -> Aux	*/
		MOV R3, #0			/*	R3 j=0	*/
forJ:	CMP R3, #N			/*	Comparamos para salir de forJ	*/
		BEQ	finJ

		MOV R2, #0			/*	R2 i=0	*/
forI:	CMP	R2, #N			/*	Comparamos para salir de forI	*/
		BEQ finI

		LDR R6, [R4, R2, LSL #2]	/*	Cargamos en R6 A[i]	*/
		LDR R9, [R4, R3, LSL #2]	/*	Cargamos en R9 A[j]	*/

		CMP R9, R6			/*	Comparamos A[j] con A[i]	*/
		BGE NoIf			/*	Si A[j] >= A[i]	saltamos a NoIf 	*/

		MOV R0, R9			/*	aux = A[j]	*/

		STR R6, [R4, R3, LSL #2] 	/*	A[j] = A[i] 	*/
		STR R0, [R4, R2, LSL #2]	/*	A[i] = Aux		*/
NoIf:
		ADD R2, #1
		B forI
finI:
		ADD R3, #1
		B forJ
finJ:
fin:	B .
		.end
