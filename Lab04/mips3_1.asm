# abs $s0, $s1
.text
	addi $s1,$zero -5 # $s1 = -5
	slt $t0, $s1, $zero # $t0 = $s1 < 0 ? 1 : 0
	beq $t0, $zero, ABS # $t0 = 0 -> $s1>0 -> nhay den ABS
	sub $s0, $zero, $s1 # $s0 = -$s1
	j EXIT
ABS:
	add $s0, $zero, $s1 # $s0 = $s1
EXIT: