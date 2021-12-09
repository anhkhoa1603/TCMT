.data
	title:	.asciiz "Tinh binh phuong 1 so.\n"
	input:	.asciiz "Vui long nhap 1 so: "
	output:	.asciiz "Ket qua: "
.text
.globl main
main:
	li $v0, 4
	la $a0, title
	syscall
	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	mul $t1, $t0, $t0
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall