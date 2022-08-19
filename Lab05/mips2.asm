.data
theSum: .asciiz "The sum of "
And:	   .asciiz " and "
is:     .asciiz " is "
.text
	addi $s0, $zero, 5 #gan $s0 = 5
	addi $s1, $zero, 7 #gan $s1 = 7
	add  $t0, $s0, $s1 #$t0 = $s0 + $s1
	
	li $v0, 4     # $v0 = 4 -> in ra chuoi theSum
	la $a0, theSum
	syscall 		# goi ham 

	li $v0, 1		#$v0 = 1 -> in ra so $s0
	la $a0, 0($s0)
	syscall		#goi ham
	
	li $v0, 4		#$v0 = 4-> in ra chuoi And
	la $a0, And
	syscall		#goi ham
	
	li $v0, 1		#$v0 = 1 -> in ra so $s1
	la $a0, 0($s1)
	syscall		#goi ham
	
	li $v0, 4		#$v0 = 4 -> in ra chuoi is
	la $a0, is
	syscall		#goi ham
	
	li $v0, 1     #$v0 = 1 -> in ra so $t0 ($t0 = $s0 + $s1)
	la $a0, 0($t0)
	syscall       #goi ham
	