.data
	input1:		.asciiz	"x: "
	input2:		.asciiz	"y: "
	output:		.asciiz	"Result: "
	result:		.word 	0
.text
.globl main
main:
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	jal pow
	sw $s2, result
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	lw $a0, result
	syscall
	
	li $v0, 10
	syscall
.end main
	
.globl pow
.ent pow
pow:
	li $t0, 1
	li $s2, 1
	
loop:	bgt $t0, $s1, end
	mul $s2, $s2, $s0
	addi $t0, $t0, 1
	j loop
end:
	jr $ra
.end pow