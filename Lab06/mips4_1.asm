#Sap xep tang dan
.data
A:	.word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
Aend:	.word

.text
main:	la $a0, A #$a0 = dia chi A[0]
		addi $s0, $zero, 12
		addi $t0, $zero, 1
		j sort 
		nop
# Ket thuc chuong trinh chinh
after_sort:	li $v0, 10
			syscall
end_main:

sort:	slt $t2, $t0, $s0
		beq $t2, $zero, after_sort
		nop
		j max # a0 != a1, thuc hien so sanh o chuong trinh con max
		nop

max:		add $t4, $t0, $t0
		add $t4, $t4, $t4
		add $a1, $a0, $t4
		lw $t1, 0($a1) #i
		li $t3, 0
loop1:	slt $t2, $t3, $t0
		beq $t2, $zero, end_loop3
		add $t4, $t3, $t3
		add $t4, $t4, $t4
		add $v0, $a0, $t4
		lw $v1, 0($v0) # j
		slt $t2, $v1, $t1
		beq $t2, $zero, end_loop2
		nop
		addi $t3, $t3, 1
		j loop1
		nop
end_loop2:addi $t5,$t0, 0 #k

loop2:	slt $t2, $t3, $t5
		bne $t2, $zero, end_loop3
		nop
		add $t4, $t5, $t5
		add $t4, $t4, $t4
		add $s1, $a0, $t4
		lw $s2, -4($s1)
		sw $s2, 0($s1)
		addi $t5, $t5, -1
		j loop2
		nop
end_loop3: lw $t1, 0($v0)
		add $t0, $t0, 1
		j max

