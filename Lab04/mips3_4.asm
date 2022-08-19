#ble $s1, $s2, lablel
.text
	addi $s1, $zero, 6 # $s1 =6
	addi $s2, $zero, 5 # $s2 =5
	slt $t0, $s2, $s1 #$t0 = $s2 < $s1 ? 1 : 0
	beq $t0, $zero, label # $t0=0 -> $s1 <= $s2 nhay den label
	add $s1, $s1, $s2 # $s1 = $s1 + $s2
	j exit
label:
	add $s2, $s1, $s2 # $s2 = $s1 + $s2
exit: