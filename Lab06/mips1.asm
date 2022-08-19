.data
A:	.word 2, 6, -1, -3, -2

.text
main:	la $a0, A # dia chi cua A[0]
		li $a1, 5 # so phan tu cua mang: n
		j mspfx   # nhay den chuong trinh con
		nop
continue:
lock:	j lock
		nop
end_of_main:

mspfx:	addi $v0, $zero, 0
		addi $v1, $zero, 0 #tong tien to lon nhat
		addi $t0, $zero, 0 # i =0
		addi $t1, $zero, 0 #tong tien to hien tai
loop:	add $t2, $t0, $t0  #$t2 = 2i
		add $t2, $t2, $t2  # $t2 = 4i
		add $t3, $t2, $a0  # $t3 = dia chi cua A[i]
		lw $t4, 0($t3)     # $t4 = A[i]
		add $t1, $t1, $t4  # cong them A[i] vao tong tien to hien tai
		slt $t5, $v1, $t1  # $t5 = tong tien to max < tong tien to hien tai ? 1 : 0
		bne $t5, $zero, mdfy #$t5 != 0 -> tong tien to max < tong tien to hien tai -> nhay den mdfy
		j test    # nhay den test
mdfy:	addi $v0, $t0, 1 # Length = i + 1
		addi $v1, $t1, 0 # gan tong tien to max = tong tien to hien tai
test:	addi $t0, $t0, 1  # i = i +1
		slt $t5, $t0, $a1 # $t5 = i < n ? 1: 0
		bne $t5, $zero, loop # neu i < n quay lai vong lap
done:	j continue # i> n ket thuc vong lap, quay ve chuong trinh chinh
mspfx_end: