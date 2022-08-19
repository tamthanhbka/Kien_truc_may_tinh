.data
	A:	.word	4, 6, -16, -3, 9, -4, 0, 5, 1		#khoi tao mang
	sum:	.word	0							#khai bao sum 
	i:	.word 	0							#khai bao	i
	n:	.word	9							#so phan tu cua mang n = 9
	step:	.word 1							#buoc nhay cua vong lap
.text
	#nap gia tri vao cac thanh ghi
	addi $s6, $zero, 0 # max = 0
	la $t6, sum								
	lw $s5, 0($t6) # $s5 = sum
	la $t7, i
	lw $s1, 0($t7) # $s1 = i
	la $s2, A		# gan dia chi bat dau mang vao thanh ghi $s2
	la $t8, n
	lw $s3, 0($t8) # $s3 = n
	la $t9, step
	lw $s4, 0($t9) # $s4 = step
	#thuc hien tinh tong	addi $s5, $zero, 0 #sum=0	addi $s1, $zero, 0 #i=0
loop:
	slt $t2, $s1, $s3	# $t2 = i < n ? 1 : 0
	beq $t2, $zero, enloop	# ket thuc vong lap
	add $t1, $s1, $s1		#$s1 = $s1*2
	add $t1, $t1, $t1		#$t1 = $s1*4
	add $t1, $t1, $s2		#gan dia chi cua A[i] cho $t1
	lw $t0, 0($t1)			#A[i] = $t0
	bltz $t0, enif			#neu A[i] < 0, nhay den enif
	slt $t2, $s6, $t0		# $t2 = max < A[i] ? 1 : 0
	beq $t2, $zero, enif_2	# $t2 = 0 nhay den step
	add $s6, $zero, $t0		# max = A[i]
	add $s1, $s1, $s4		# i = i + step
	j loop				# quay lai vong lap
enif:
	sub $t0, $zero, $t0		#A[i] = -A[i]
	slt $t2, $s6, $t0		#$t2 = max < A[i] ? 1 : 0
	beq $t2, $zero, enif_2	#neu $t2 = 0 nhay den step
	add $s6, $zero, $t0		# max = A[i]
enif_2:	# tang gia tri cho buoc nhay
	add $s1, $s1, $s4	# i = i + step
	j loop	# quay ve vong lap
enloop:	
	