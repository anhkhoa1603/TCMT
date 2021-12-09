.data
	title: .asciiz "Tinh thuong 2 so nguyen\n"
.text
.globl main
main:
	li $v0, 4
	la $a0, title
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	li $v0, 2
	div.s $f3, $f1, $f2
	mov.s $f12, $f3
	syscall
	
	li $v0, 10
	syscall