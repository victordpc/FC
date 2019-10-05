	.global rgb2gray

/*	.equ COEF1, 3483*/
/*	.equ COEF2, 11718*/
/*	.equ COEF3, 1183*/

	.text

/*rgb2gray:
//  		ldr r3, =COEF1
//  		mul r0, r3, r0
//  		ldr r3, =COEF2
//  		mla r0, r3, r1, r0
//  		ldr r3, =COEF3
//  		mla r0, r3, r2, r0
//  		mov r0, r0, lsr #14
//
//  		mov pc, lr
*/

	.global RGB2GrayMatrix
	.extern rgb2gray
		.equ i, -12
		.equ j, -16
		.equ orig, -20
		.equ dest, -24
		.equ N,128
		.equ M,128

.text

RGB2GrayMatrix:
        //COMPLETAR: Apartado 4.9.5.3 del manual de la practica 4
        // Recuerde comentar la implementacion C de la función
// void RGB2GrayMatrix(pixelRGB orig[N][M]->R0, unsigned char dest[N][M]-> R1) {
//    int i,j;

/*Prologo*/
/*		push {R4,R5,R6,R7,R8,R9,fp,lr,pc}	*/
/*		ADD FP, SP, #32			32=4*9-4	*/
		push {R4,R5,R6,R7,R8,R9,lr,pc}
/*Prologo*/

		mov R4, #0 //i
		mov R5, #0 //j
		mov R6, #0
		mov R7, R0
		mov R8, R1
		mov R9, #0

//    for (i=0;i<N;i++)
forI:	CMP R4, #N
		BEQ	finI

//        for (j=0; j<M; j++)
		MOV R5, #0
forJ:	CMP	R5, #M			/*	Comparamos para salir de forJ	*/
		BEQ finJ

//            dest[i][j] =  rgb2gray(orig[i][j].R, orig[i][j].G, orig[i][j].B);
		MOV R0, #N
		MUL R6, R4, R0
		ADD R6, R6, R5

		ADD R9, R6, R8

		MOV R0, #3
		MOV R1, R6
		MUL R6, R1, R0
		ADD R0, R7, R6 /*	Movemos a R0 la direccion de memoria [i][j].R	*/

		ADD R6, R6, #1
		ADD R1, R7, R6 /*	Movemos a R1 la direccion de memoria [i][j].G	*/

		ADD R6, R6, #1
		ADD R2, R7, R6 /*	Movemos a R2 la direccion de memoria [i][j].B	*/

		/*	Llamamos a la funcion Rgb2Gray(R, G, B)	*/
		BL rgb2gray

		/*	guardamos la vuelta de rgb2gray	*/
		STRB R0, [R9]


		ADD R5, #1
		B forJ
finJ:

		ADD R4, #1
		B forI
finI:

/*		pop {R4,R5,R6,R7,R8,R9,fp,lr,pc}	*/
		pop {R4,R5,R6,R7,R8,R9,lr,pc}

		mov PC, LR

.end


