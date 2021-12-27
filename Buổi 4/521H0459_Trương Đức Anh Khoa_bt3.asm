.data
	input:		.asciiz	"n: "
	output:		.asciiz	"Result: "
	result:		.word 	0
.text
.globl main
main:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	jal giaiThua
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 10
	syscall
.end
	
.globl giaiThua
.ent giaiThua
giaiThua:

	li $t0, 1
	li $s1, 1
	
loop:	bgt $t0, $s0, exit
	mul $s1, $s1, $t0
	addi $t0, $t0, 1
	j loop
	
exit:	jr $ra	
	
.end giaiThua