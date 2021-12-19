.data
	msg:		.asciiz	"So sanh 2 so a va b\n"
	input1:		.asciiz "Nhap a: "
	input2:		.asciiz "Nhap b: "
	lon:		.asciiz	"a > b"
	be:		.asciiz	"a < b"
	bang:		.asciiz "a = b"
.text
.globl main
main:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	bgt $t0, $t1, lonHon
	blt $t0, $t1, nhoHon
	
	li $v0, 4
	la $a0, bang
	syscall
	
lonHon: li $v0, 4
	la $a0, lon
	syscall
	j exit
	
nhoHon:	li $v0, 4
	la $a0, be
	syscall
	j exit
	
exit: 	li $v0, 10
	syscall
