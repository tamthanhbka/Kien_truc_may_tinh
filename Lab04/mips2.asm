.data
x: .word 0x12345678
.text
	lw $s0, x # $s0 = x
	andi $t1, $s0, 0xff000000 # $t1 = 0x12000000
	srl $t1, $t1, 24 # dich 24 bit -> t1 = 0x12
	
