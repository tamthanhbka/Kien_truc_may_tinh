.data
string: .space 80
message1: .asciiz "Nhap vao chuoi: "
message2: .asciiz "\nChuoi dao nguoc:\n"
.text
	addi $s0, $zero, 21 # chieu dai toi da chuoi co the nhap vao i
	la   $a1, string
	li $v0, 4 # in ra thong bao 1
	la $a0, message1
	syscall
read:
	li $v0, 12 # goi ham doc tung ky tu
	syscall
	
	addi $s0, $s0, -1 # giam so ky tu co the doc vao i = i -1
	beq $v0, 10, end_read # gap dau enter, ket thuc doc vao
	beqz $s0, end_read # nhap qua 20 ky tu, ket thuc doc vao
	
	add $t1, $s0, $a1  # lay dia chi cua string[i]
	sb $v0, 0($t1) # gan ki tu vua doc vao t1
	j read 
end_read:
	#in ra thong bao 2
	li $v0, 4
	la $a0, message2
	syscall
	#in ra chuoi nguoc
	li $v0, 4
	la $a0, 0($t1)
	syscall
	