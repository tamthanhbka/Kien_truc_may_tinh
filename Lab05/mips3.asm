.data
x: .space 50
y: .asciiz "Le Duc Son"
.text
	la $a0, x
	la $a1, y
strcpy: add $s0, $zero, $zero # khai bao bien dem i = 0
L1:	add $t1, $s0, $a1 # $t1 = i + y[0] 
	lb $t2, 0($t1) #$t2 = y[i]
	add $t3, $s0, $a0 # $t3 = i + x[0] 
	sb $t2, 0($t3) # x[i] = y[i]
	beq $t2, $zero, end_of_string # $t2 = 0, ket thuc
	nop
	addi $s0, $s0, 1 # i = i + 1
	j L1 
	nop
end_of_string:
	# in ra chuoi x
	li $v0, 4
	la $a0, x
	syscall
	
