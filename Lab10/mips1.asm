.eqv SEVENSEG_LEFT    0xFFFF0011# Dia chi cua den led 7 doan trai.
						  #     Bit 0 = doan a; 
						  #     Bit 1 = doan b; ... 
						  #     Bit 7 = dau .
.eqv SEVENSEG_RIGHT   0xFFFF0010# Dia chi cua den led 7 doan phai
.text
#1: 6
#2: 91
#3: 79
#4: 102
#5: 109
#6: 125
#7: 7
#8: 127
#9: 111
main:li    $a0,   125              # set value for segments
	jal   SHOW_7SEG_LEFT          # show
	li    $a0,  79             # set value for segments
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