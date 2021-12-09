.data
	msg:		.asciiz	"Kiem tra so am so duong\n"
	input:		.asciiz "Nhap N: "
	soDuong:	.asciiz	"Day la so duong"
	soAm:		.asciiz	"Day la so am"
	soKhong:	.asciiz "Day la so 0"
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
	
	bgt $t0, $0, duong
	blt $t0, $0, am
	
	li $v0, 4
	la $a0, soKhong
	syscall
	
duong: 	li $v0, 4
	la $a0, soDuong
	syscall
	j exit
	
am:	li $v0, 4
	la $a0, soAm
	syscall
	j exit
	
exit: 	li $v0, 10
	syscall