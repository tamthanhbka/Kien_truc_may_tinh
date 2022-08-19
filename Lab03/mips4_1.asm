#truong hop if(i<j)
.data
X: .word -4	#khoi tao x = -4
Y: .word	3	#khoi tao y = 3
Z: .word	2	#khoi tao z = 2
.text
	addi $s1, $zero, 5	#i = 5
	addi $s2, $zero, 5	#j = 5
	la $t7, X 
	lw $t1, 0($t7)  # $t1 = X
	la $t8, Y
	lw $t2, 0($t8)  # $t2 = y
	la $t9, Z
	lw $t3, 0($t9)	 # $t3 = Z
start:
	slt $t0, $s1, $s2			# i < j -> $t0 = 1
	beq $t0, $zero, else		# $t0 = 0 nhay den else
	addi $t1, $t1, 1			# x = x + 1
	addi $t3, $zero, 1			# z = 1
	j endif					# ket thuc chuong trinh
else:
	addi $t2, $t2, -1			# y = y - 1
	add $t3, $t3, $t3			# z = z * 2 
endif:
	
