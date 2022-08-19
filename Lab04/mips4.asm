.data
X: .word 0x80000000
Y: .word -10
.text
	lw $s1,X
	lw $s2,Y
start:
	li $t0, 0 # trạng thái ban đầu không có tràn
	addu $s3, $s1, $s2 # s3=s1+s2
	xor $t1,$s1,$s2 # kiểm tra dấu của s1 và s2, nếu s1 và s2 cùng dấu t1>0, nếu s1 và s2 khác dấu t1 < 0
	
	bltz $t1, EXIT # nếu t1 < 0, không tràn, kết thúc kiểm tra 
	xor $t2, $s3, $s1 # $s3 va $s1 khac dau $t2 < 0, nguoc lai $t2 > 0
	bltz $t2,OVERFLOW # neu $t2 < 0, say ra tran so, nhay den OVERFLOW
	j EXIT
OVERFLOW:
	li $t0, 1 # có tràn số -> t0 = 1
EXIT:
	