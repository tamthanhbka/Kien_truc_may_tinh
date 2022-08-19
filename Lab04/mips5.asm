.data
x: .word 6 # x = 6
y: .word 8 # y = 8
p: .word 0
i: .word 0 # i = 0
.text
	lw $s1, x # $s1 = x
	lw $s2, y # $s2 = y
	lw $s3, i # $s3 = i
	la $t8, p
	li $t0, 1
loop:
	beq $s2, $t0, enloop # y = 1, ket thuc vong lap
	srl $s2, $s2, 1 # y = y : 2
	addi $s3, $s3, 1 # i = i + 1
	j loop
enloop:
	sllv $t1, $s1, $s3 # p = x*y
	sw $t1, 0($t8) 