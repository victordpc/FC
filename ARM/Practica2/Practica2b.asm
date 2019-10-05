/*51458991-X*/
.global start

.equ N, 8

.data
A: .word 7, 3, 25, 4, 75, 2, 1, 1

.bss
B:	 .space N*4
max: .space 4
ind: .space 4

.text
start:
		LDR R1, =max		/*	R1 Mem MAX	*/

		MOV R7, #0
		LDR R8, =ind		/*	R8 Mem IND	*/
		STR R7, [R8]		/*	R7 Val IND	*/

		LDR R4, =A			/*	R4 A	*/
		LDR R5, =B			/*	R5 B	*/

		MOV R3, #0			/*	R3 j=0	*/
forJ:	CMP R3, #N			/*	Comparamos para salir de forJ	*/
		BEQ	finJ

		MOV R0, #0
		STR	R0, [R1]		/*	max = 0	*/

		MOV R2, #0			/*	R2 i=0	*/
forI:	CMP	R2, #N			/*	Comparamos para salir de forI	*/
		BEQ finI

		LDR R6, [R4, R2, LSL #2]	/*	Cargamos en R6 A[i]	*/
		CMP R6, R0			/*	Comparamos A[i] con Max	*/
		BLE NoIf			/*	Si A[i] <= Max	*/

		MOV R0, R6
		STR R0, [R1]		/*	MAX = A[i]	*/

		MOV R7, R2
		STR	R7, [R8]		/*	IND = i 	*/

NoIf:
		ADD R2, #1
		B forI

finI:

		LDR R9, [R4, R7, LSL #2]	/*	Recuperamos A[ind]	*/
		STR R9, [R5, R3, LSL #2]	/*	Guardamos B[j] = A[ind]	*/

		MOV R0, #0
		STR R0, [R4, R7, LSL #2]	/*	Guardamos A[ind]=0	*/

		ADD R3, #1
		B forJ
finJ:

fin:	B .
		.end
