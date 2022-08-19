.data
test: .asciiz "Le Duc Son"
.text
	li $v0, 4
	la $a0, test
	syscall