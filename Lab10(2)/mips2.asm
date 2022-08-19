.eqv KEY_CODE   0xFFFF0004       # ASCII code from key
.eqv KEY_READY  0xFFFF0000       # =1 if has a new keycode ?
						   #Auto clear after lwboard, 1 byte
.eqv DISPLAY_CODE   0xFFFF000C   # ASCII code to show, 1 byte
.eqv DISPLAY_READY  0xFFFF0008   # =1 if the display has already to do
						   # Auto clear after sw
.data
exit: .asciiz "exit"
.text
	li $k0,  KEY_CODE
	li $k1,  KEY_READY
	li $s0, DISPLAY_CODE
	li $s1, DISPLAY_READY
	li $t3, 0
	la $s3, exit
loop:        nop

WaitForKey:  lw $t1, 0($k1)           # $t1 = [$k1] = KEY_READY
		   beq $t1, $zero, WaitForKey # if $t1 == 0 then Polling
		   
ReadKey:     lw $t0, 0($k0)           # $t0 =[$k0] = KEY_CODE

WaitForDis:  lw $t2, 0($s1)            # $t2 = [$s1] = DISPLAY_READY
		   beq $t2, $zero, WaitForDis # if $t2 == 0 then Polling
		   bgt $t0, 47, check1
		   j Encrypt
		   nop
check1:	   bgt $t0, 57, check2
	   	   addi $t0, $t0, 0
	   	   j ShowKey
	   	   nop
check2:	   bgt $t0, 64, check3
		   j Encrypt
		   nop
check3:      bgt $t0, 90, check4
		   addi $t0, $t0, 32
		   j ShowKey
		   nop
check4:      bgt $t0, 96, check5
		   j Encrypt
		   nop
check5:      bgt $t0, 122, Encrypt
		   add $s4, $t3, $s3
		   lb $t4, 0($s4)
		   beq $t4, $t0, next
		   beq $t0, 101, next2
		   addi $t3, $t3, 0
    	        addi $t0, $t0, -32
		   j ShowKey
		   nop
next: 	   addi $t3, $t3, 1
		   addi $t0, $t0, -32
		   j ShowKey
		   nop
next2: 	   addi $t3, $0, 1
		   addi $t0, $t0, -32
		   j ShowKey
		   nop
Encrypt:     addi $t0, $0, 42 # change input key

ShowKey:     sw $t0, 0($s0)# show key
		   nop
		   nop
		   beq $t3, 4, end_main             
		   j loop
end_main: