.data
	msg:		.asciiz	"Kiem tra so am so duong\n"
	input:		.asciiz "Nhap N: "
	output1:	.asciiz "Nhap sai. Nhap lai: "
	output2:	.asciiz "Ket qua hop le!"
.text
.globl main
main:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
loop:	bgt $t0, $0, exit
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	j loop
	
exit:	li $v0, 4
	la $a0, output2
	syscall
	
	li $v0, 10
	syscall