#Sap xep giam dan
.data
A:	.word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
.text
main:	la $a0, A #$a0 = dia chi A[0]
		li $a1, 12 # n = 12
		addi $s0, $zero, 1 
		j sort # nhay den chuong trinh con sort
		nop
# Ket thuc chuong trinh chinh
after_sort:	li $v0, 10
			syscall
end_main:
sort:	beq $s0, $zero, after_sort # neu khong co su thay doi, hoan thanh so sanh
		nop
		j min # co su thay doi -> nhay den min de thuc hien so sanh
		nop
after_min:	addi $s0, $s0, 1
			lw $t4, 0($v1) # luu gia tri cua phan tu ke tiep vao $t4
			sw $t4, 0($v0) # luu gia tri cua phan tu ke tiep vao dia chi phan tu hien tai
			sw $t1, 0($v1) # luu gia tri phan tu hien tai vao dia chia phan tu ke tiep
			j set
			nop		
min:		addi $s0, $zero, 0 # set so lan thay doi ve 0
		addi $t0, $zero, 0 # i = 0
		addi $v0, $a0, 0 # $v0 : dia chi phan tu dang xet ( ban dau la dia chi A[0]
		lw $t1, 0($v0) # $t1 : phan tu dang xet (ban dau = A[0]	
loop:	slt $t3, $t0, $a1 # i < n ?
		beq $t3, $zero, sort # i > n -> ket thuc vong lap
		nop
		addi $v1, $v0, 4 # $v1 = dia chi phan tu ke tiep
		lw $t2, 0($v1) # $t2 = gia tri phan tu ke tiep
		slt $t3, $t1, $t2 # neu phan tu hien tai nho hon phan tu ke tiep
		bne $t3, $zero, after_min
		nop
set:		addi $t0, $t0, 1
		add $s2, $t0, $t0  #$s2 = 2i
		add $s2, $s2, $s2  # $s2 = 4i
		add $v0, $s2, $a0 
		lw $t1, 0($v0) 
		j loop
		nop
