.data
X: .word -10
Y: .word -1
.text
	lw $s1,X
	lw $s2,Y
start:
	li $t0, 0 # trạng thái ban đầu không có tràn
	addu $s3, $s1, $s2 # s3=s1+s2
	xor $t1,$s1,$s2 # kiểm tra dấu của s1 và s2, nếu s1 và s2 cùng dấu t1>0, nếu s1 và s2 khác dấu t1 < 0
	
	bltz $t1, EXIT # nếu t1 < 0, không tràn, kết thúc kiểm tra 
	slt $t2, $s3, $s1 # t2 = s3 < s1 ? 1 : 0
	bltz $s1, NEGATIVE #nếu s1 < 0 , nhảy đến NEGATIVE 
	beq $t2, $zero, EXIT # nếu t2 = 0 -> s3>s1 -> không tràn -> kết thúc kiểm tra 
	j OVERFLOW
NEGATIVE:
	bne $t2, $zero, EXIT # nếu t2 = 1 -> s3<s1 -> không tràn -> kết thúc kiểm tra 
OVERFLOW:
	li $t0, 1 # có tràn số -> t0 = 1
EXIT:
	