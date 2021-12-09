.data
	msg:	.asciiz	"Tong cac so chan tu 1 toi N\n"
	input:	.asciiz	"Nhap N "
	output:	.asciiz	"Ket qua: "
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
	
	li $t1, 1
loop:	bgt $t1, $t0, exit
	rem $t3, $t1, 2
	beq $t3, 1, le
	add $t2, $t2, $t1
	add $t1, $t1, 1
	j loop
	
le:	add $t1, $t1, 1
	j loop
	
exit: 	li $v0, 4
	la $a0, output
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 10
	syscall