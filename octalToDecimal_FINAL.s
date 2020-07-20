.data
		numdecimal:.asciiz "\nDigite um valor decimal: "
.text
main:

		enquantoIntervalo:		#while para filtrar 1 < numero < 10000

		li $v0, 4  				#Prepara escrita (string)
		la $a0, numdecimal		#Escreve o texto
		syscall					#Chamada

		li $v0, 5				#Atribuir valor em $v0
		syscall					#Chamada do sistema para a leitura, do valor que ficará, temporáriamente, no registrador v0
		add $t1, $v0, $zero		#Soma, em t1, o valor de v0 com 0. Apenas para movimentação.

		ble $t1, 1, enquantoIntervalo
		bge $t1, 9999, enquantoIntervalo


		bge $t1, 1000, enquantoMil

		bge $t1, 100, enquantoCem

		bge $t1, 10, enquantoDez

		bge $t1, 1, enquantoUm
		

		

		enquantoMil:	
								#Condicao enquanto maior que 1000
		sub $t1, $t1, 1000
		add $t2, $t2, 1 
		bge $t1, 1000, enquantoMil

						
		enquantoCem:	
								#Condicao enquanto maior que 1000
		sub $t1, $t1, 100
		add $t3, $t3, 1 
		bge $t1, 100, enquantoCem

		enquantoDez:
								#Condicao enquanto maior que 100
		sub $t1, $t1, 10
		add $t4, $t4, 1 
		bge $t1, 10, enquantoDez

		enquantoUm:				#Condicao enquanto maior que 1
		sub $t1, $t1, 1
		add $t5, $t5, 1 
		bgt $t1, 0, enquantoUm




		mul $s0, $t2, 8
		mul $s0, $s0, 8
		mul $s0, $s0, 8

		mul $s1, $t3, 8
		mul $s1, $s1, 8

		mul $s2, $t4, 8	

		add $s3, $t5, 0

		add $s4, $s3, $s2
		add $s4, $s4, $s1
		add $s4, $s4, $s0

		li $v0, 1
		la $a0, ($s4)
		syscall

		

		