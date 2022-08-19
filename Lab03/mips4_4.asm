#truong hop if(i+j>m+n)
.data
X: .word -4	#khoi tao x = -4
Y: .word	3	#khoi tao y = 3
Z: .word	2	#khoi tao z = 2
.text
	addi $s1, $zero, 6	#i = 6
	addi $s2, $zero, 5	#j = 5
	addi $s3, $zero, 7	#m = 7
	addi $s4, $zero, 8	#n = 8
	la $t7, X 
	lw $t1, 0($t7)  # $t1 = X
	la $t8, Y
	lw $t2, 0($t8)  # $t2 = y
	la $t9, Z
	lw $t3, 0($t9)	 # $t3 = Z
start:
	add $t4, $s1, $s2	#$t4 = i + j
	add $t5, $s3, $s4	#$t5 = m + n
	slt $t0, $t5, $t4	#$t0 = $t5 < $t4 ? 1 : 0
	beq $t0, $zero, else	# neu $t0 = 0 thi nhay den esle
	addi $t1, $t1, 1			# x = x + 1
	addi $t3, $zero, 1			# z = 1
	j endif					# ket thuc chuong trinh
else:
	addi $t2, $t2, -1			# y = y - 1
	add $t3, $t3, $t3			# z = z * 2 
endif: