.eqv SEVENSEG_LEFT    0xFFFF0011# Dia chi cua den led 7 doan trai.
						  #     Bit 0 = doan a; 
						  #     Bit 1 = doan b; ... 
						  #     Bit 7 = dau .
.eqv SEVENSEG_RIGHT   0xFFFF0010# Dia chi cua den led 7 doan phai
.data
message: .asciiz "Nhap vao so nguyen bat ki: "
arr:	    .byte 63,6,91,79,102,109,125,7,127,111
.text
#0:63
#1: 6
#2: 91
#3: 79
#4: 102
#5: 109
#6: 125
#7: 7
#8: 127
#9: 111
	la $t1, arr
	li $v0, 4
	la $a0, message
	syscall
	li $v0, 5   #nhap vao so nguyen
	syscall
	addi $s0, $v0, 0
	li $s5, 100
	div $s0, $s5
	mfhi $s1
	li $s5, 10
	div $s1, $s5
	mfhi $s2 # lay ra hang don vi
	mflo $s3 # lay ra hang chuc
	add $s4, $t1, $s3
	lb $a0,0($s4)
	jal   SHOW_7SEG_LEFT          # show
	add $s4, $t1, $s2
	lb $a0, 0($s4)
	jal   SHOW_7SEG_RIGHT         # show   
exit:     li    $v0, 10
		syscall
endmain:
#---------------------------------------------------------------
# Function  SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in]  $a0   value to shown       
# remark     $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_LEFT:  li   $t0,  SEVENSEG_LEFT # assign port's address
			  sb   $a0,  0($t0)# assign new value
			  jr   $ra
#---------------------------------------------------------------
# Function  SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in]  $a0   value to shown       
# remark     $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_RIGHT: li   $t0,  SEVENSEG_RIGHT# assign port's address
			  sb   $a0,  0($t0)# assign new value
			  jr   $ra   