#Sap xep giam dan
.data
A:	.word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
Aend:	.word

.text
main:	la $a0, A #$a0 = dia chi A[0]
		la $a1, Aend # $a1 = dia chi Aend
		addi $a1, $a1, -4 # $a1 = dia chi A[n-1]
		j sort 
		nop
# Ket thuc chuong trinh chinh
after_sort:	li $v0, 10
			syscall
end_main:

sort:	beq $a0, $a1, done  # neu a0 = a1 -> ket thuc so sanh, quay ve chuong trinh chinh
		j min # a0 != a1, thuc hien so sanh o chuong trinh con min
after_min:	lw $t0, 0($a1) # luu gia tri tai dia chi cuoi vua phan chua sap xep vao $t0
			sw $t0, 0($v0) # luu gia tri phan tu cuoi cua mang chua sap xep vao dia chi phan tu min
			sw $v1, 0($a1) #luu gia tri phan tu min vao dia chi phan tu cuoi cua mang chua sap xep
			addi $a1, $a1, -4 # set lai dia chi cho phan tu cuoi cua mang chua sap xep
			j sort # quay lai chuong trinh con sort
done :		j after_sort # quay lai chuong trinh chinh

min:		addi $v0, $a0, 0 # con tro chua gia tri min cua mang chua sap xep
		lw   $v1, 0($v0) # gia tri min cua mang chua sap xep ( ban dau bang phan tu dau tien)
		addi $t0, $a0, 0 # con tro chay cua mang chua sap xep
loop:	beq $t0, $a1, ret # neu con tro chay = con tro cuoi cua mang chua sap xep -> ket thuc 
		addi $t0, $t0, 4 # nhay den phan tu ke tiep
		lw $t1, 0($t0) # lay gia tri phan tu ke tiep vao t1
		slt $t2, $t1, $v1 # phan tu ke tiep < min ?
		beq $t2, $zero, loop # neu phan tu ke tiep >= min -> quay lai vong lap
		addi $v0, $t0, 0 #neu phan tu ke tiep < min -> dia chi min = dia chi phan tu ke tiep
		addi $v1, $t1, 0 # min = gia tri phan tu ke tiep
		j loop # quay ve vong lap
		nop
ret: 	j after_min # quay ve chuong trinh con sort
		
