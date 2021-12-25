.data
	mang:		.word	0
	n:		.word 	0
	msgnhap1:	.asciiz "Nhap N: "
	msgnhap2:	.asciiz "Nhap mang: \n"
	msgxuat1:	.asciiz	"xuat mang: \n"
	msgxuat2:	.asciiz ", "
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
	
	li $v0, 4
	la $a0, msgxuat1
	syscall
	
	la $s0, mang
	li $s1, 0

loop1:	li $v0, 1
	lw $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, msgxuat2
	syscall
	
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s2, loop1
	
	li $v0, 10
	syscall