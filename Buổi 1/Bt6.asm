.data
	Chieu_dai:	.float  16.2
	Chieu_rong:	.float	20.3
	sum:		.float	2.0
	input: 		.asciiz "Chu vi HCN la: "
	input1: 	.asciiz "\nDien tich HCN la: "
.text
	li $v0,4
	la $a0,input
	syscall
.globl main
main:	
	lwc1 $f1,Chieu_dai
	lwc1 $f2,Chieu_rong
	lwc1 $f0 sum
	
	add.s $f3,$f1,$f2
	mul.s $f12,$f3,$f0
	
	li $v0,2
	syscall
	
	li $v0,4
	la $a0,input1
	syscall
	
	mul.s $f12,$f1,$f2
	li $v0,2
	syscall