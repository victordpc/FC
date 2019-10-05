/*	51458991-X	*/
.extern _stack
.global start

.equ longA, 8

.data
A: .word 7, 3, 25, 4, 75, 2, 1, 1

.bss
max: .space 4

.text
start:
		LDR SP, =_stack		/*	Carga en SP de la pila de llamadas			*/
		MOV FP, #0			/*	Marca para FP								*/
		LDR R1, =A			/*	Carga de direccion de memoria de A en R1	*/
		MOV R2, #longA		/*	Carga de valor longA en R2					*/

		BL MAX

		LDR R2, =max		/*	Carga de la direccion de memoria de max en R2	*/
		STR R0, [R2]		/*	Guardado del valor max en memoria				*/

		B .

/*	int MAX(int A[] {R1}, int longA {R2})	*/
/*	ind {R0} max {R3}						*/
MAX:	PUSH {R4, R5, FP}	/*	Salvamos R4, R5, FP	*/
		ADD FP, SP, #8		/*	8=4*3-4				*/

		MOV R0, #0
		MOV R3, #0
		MOV R4, #0			/*	R4 i=0	*/
forI:	CMP	R4, R2			/*	Comparamos para salir de forI	*/
		BEQ finI

		LDR R5, [R1, R4, LSL #2]	/*	Cargamos en R5 A[i]		*/
		CMP R5, R3					/*	Comparamos A[i] con Max	*/
		BLE NoIf					/*	Si A[i] <= Max			*/

		MOV R3, R5			/*	MAX = A[i]	*/
		MOV R0, R4			/*	IND = i 	*/

NoIf:
		ADD R4, #1
		B forI
finI:
		/*	Recuperamos R4, R5, FP	*/
		POP {R4, R5, FP }
		MOV PC, LR

		.end
