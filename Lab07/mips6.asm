.data
Message1:		.asciiz "Largest: "
Message2: 	.asciiz "\nSmallest:"
Comma:		.asciiz ","
.text
main: li $s0, 2            	# Load input 
	li $s1, 3
	li $s2, -1
	li $s3, 4
	li $s4, 9
	li $s5, -2
	li $s6, 8
	li $s7, 5
	jal init 			
	nop
	li $v0, 4		
	la $a0, Message1	 	#in ra message1
	syscall
	li $v0 , 1
	add $a0,$t0,$zero
	syscall          	#in ra max value
	li $v0, 4
	la $a0, Comma   	#in ra ","
	syscall 
	li $v0 , 1		
	add $a0,$t5,$zero   	# in ra max value's position
	syscall	
	li $v0, 4
	la $a0, Message2		#in ra message2
	syscall
	li $v0 ,1
	add $a0,$t1,$zero
	syscall     		#in ra min value
	li $v0 ,4
	la $a0, Comma 		#in ra ","
	syscall		
	li $v0 , 1
	add $a0,$t6,$zero
	syscall       		# in ra min value's position
	li $v0, 10	
	syscall			# exit
endmain:
Max:add $t0,$t3,$zero	# set Max = $t3
	add $t5,$t2,$zero	# set i of max = $t2
	jr $ra
Min:add $t1,$t3,$zero	# set Min = $t3
	add $t6,$t2,$zero	# set i of min = $t2
	jr $ra
init:	add $fp,$sp,$zero	# save address of origin sp
	addi $sp,$sp, -32	# create space for stack
	sw $s1, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)
	sw $s4, 12($sp)
	sw $s5, 16($sp)
	sw $s6, 20($sp)
	sw $s7, 24($sp)
	sw $ra, 28($sp)		# save $ra for main
	add $t0,$s0,$zero	# set Max = $s0
	add $t1,$s0,$zero	# set Min = $s0
	li $t5, 0		# set $t5 to 0
	li $t6, 0		# set $t6 to 0
	li $t2, 0		# set $t2 to 0 , i = 0 
max_min:addi $sp,$sp,4
	lw $t3,-4($sp)
	sub $t4, $sp, $fp	# check if meet $ra
	beq $t4,$zero, done	# if true then done
	addi $t2,$t2,1		# i++
	sub $t4,$t0,$t3		# Max - $t3
	bltzal $t4, Max	# if Max - $t3 < 0, swap Max
	sub $t4,$t3,$t1		# $t3 - Min
	bltzal $t4, Min	# if $t3 – Min < 0 , swap Min
	j max_min		# repeat
done: 	lw $ra, -4($sp)		# load #$ra
	jr $ra 			# return