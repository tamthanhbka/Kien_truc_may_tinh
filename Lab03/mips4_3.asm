#truong hop if(i+j<=0)
.data
X: .word -4	#khoi tao x = -4
Y: .word	3	#khoi tao y = 3
Z: .word	2	#khoi tao z = 2
.text
	addi $s1, $zero, 6	#i = 6
	addi $s2, $zero, 5	#j = 5
	la $t7, X 
	lw $t1, 0($t7)  # $t1 = X
	la $t8, Y
	lw $t2, 0($t8)  # $t2 = y
	la $t9, Z
	lw $t3, 0($t9)	 # $t3 = Z
start:
	add $t4, $s1, $s2	#$t4 = i + j
	bgtz $t4,else		# nhay den else neu i + j > 0
	addi $t1, $t1, 1			# x = x + 1
	addi $t3, $zero, 1			# z = 1
	j endif					# ket thuc chuong trinh
else:
	addi $t2, $t2, -1			# y = y - 1
	add $t3, $t3, $t3			# z = z * 2 
endif: