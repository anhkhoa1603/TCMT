.data
	mang:		.word	0
	n:		.word 	0
	msgnhap1:	.asciiz "Nhap N: "
	msgnhap2:	.asciiz "Nhap mang: \n"
	msgxuat1:	.asciiz	"\nMax: "
	msgxuat2:	.asciiz "\nMin: "
.text
.globl main
main:
	li $v0, 4
	la $a0, msgnhap1
	syscall
	
	li $v0, 5
	syscall
	sw $v0, n
	lw $s2, n
	
	li $v0, 4
	la $a0, msgnhap2
	syscall
	
	la $s0, mang
	li $s1, 0
	
loop:	li $v0, 5
	syscall
	sw $v0, ($s0)
	
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s2, loop
	
	la $s0, mang
	li $s1, 0
	li $s3, 0

max:	lw $t0, ($s0)
	ble $t0, $s3, max1
	add $s3, $t0, $0
	
max1:	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s2, max
	
	la $s0, mang
	li $s1, 0
	la $s4, ($s0)
	
min:	lw $t0, ($s0)
	bge $t0, $s4, min1
	add $s4, $t0, $0
	
min1:	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s2, min
	
	li $v0, 4
	la $a0, msgxuat1
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, msgxuat2
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	li $v0, 10
	syscall
	
	