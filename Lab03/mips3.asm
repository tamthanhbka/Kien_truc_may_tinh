.data
	test: .word 2
.text
	la $s0, test
	lw $s1,0($s0) # $s1 = test
	li $t0, 0		# $t0 = 0 
	li $t1, 1		# $t1 = 1
	li $t2, 2		# $t2 = 2
	addi $s2, $zero, 3
	addi $s3, $zero, 5
	beq $s1, $t0, case_0	# neu $s1 = $t0 thuc hien case 0
	beq $s1, $t1, case_1	# neu $s1 = $t1 thuc hien case 1
	beq $s1, $t2, case_2	# neu $s1 = $t2 thuc hien case 2
	j default
case_0:
	addi $s2, $s2, 1	#a=a+1
	j continue
case_1:
	sub $s2, $s2, $t1	#a=a-1
	j continue
case_2:
	add $s3, $s3, $s3	#b=b*2
	j continue
default:
continue:
	