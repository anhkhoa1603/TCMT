.data
	title:	.asciiz "Tinh tong 2 so thuc\n"
	input1:	.asciiz "So thu nhat: "
	input2:	.asciiz "So thu hai: "
	output: .asciiz "Ket qua: "
.text
.globl main
main:
	li $v0, 4
	la $a0, title
	syscall
	
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	add.s $f3, $f2, $f1
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 2
	mov.s $f12, $f3
	syscall
	
	li $v0, 10
	syscall
	