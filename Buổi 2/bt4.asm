.data
	msg:	.asciiz	"Kiem tra n có chia het cho 3 hay khong\n"
	input:	.asciiz	"Nhap N "
	output:	.asciiz	"N chia het cho 3"
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
	
	rem $t1, $t0, 3
	bne $t1, $0, exit
	
	li $v0, 4
	la $a0, output
	syscall
	
exit: 	

	li $v0, 10
	syscall