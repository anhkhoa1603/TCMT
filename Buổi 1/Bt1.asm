.data
	title: .asciiz "Sinh vien TDTU xin chao cac ban\n"
.text
.globl main
main:
	li $v0, 4
	la $a0, title
	syscall
	
	li $v0, 10
	syscall
	