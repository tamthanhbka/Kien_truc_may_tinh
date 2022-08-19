.data
string: .space  100
Message1: .asciiz "Nhap xau: "
Message2: .asciiz "Do dai xau la: "
.text
main:
get_string: li $v0, 54  # ham in ra hop thoai de doc chuoi
		  la $a0, Message1 # dia chi thong bao 1
		  la $a1, string # de chi chuoi nhap vao
		  la $a2, 100 # do dai max chuoi nhap vao
	  	  syscall #goi ham
get_length: la $a0, string # load dia chi cua chuoi nhap vao
		  add $t0, $zero, $zero # Khai bao bien dem i ( la bien luu do dai chuoi )
check_char: add $t1, $a0, $t0 # $t1 la dia chi string[i]
		  lb $t2, 0($t1) # $t2 = str[i](gia tri)
		  beq $t2, $zero, end_of_string # khi gap ki tu ket thuc, ket thuc chuong trinh va in ra man hinh do dai chuoi
		  nop
		  addi $t0, $t0, 1 # i = i + 1
		  j check_char 
		  nop
end_of_string:
print_length: li $v0, 56  # in ra hop thoai de in ra do dai chuoi
		    la $a0, Message2 # dia chi thong bao 2
		    addi $t0, $t0, -1 # loai bo ki tu ket thuc
		    la $a1, 0($t0) #  do dai chuoi
		    syscall # goi ham
		    

	