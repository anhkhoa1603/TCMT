.data
	mang:		.word	0
	n:		.word 	0
	msgnhap1:	.asciiz "Nhap N: "
	msgnhap2:	.asciiz "Nhap mang: \n"
	msgxuat1:	.asciiz	"\nTong chan: "
	msgxuat2:	.asciiz "\nTong le: "
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
	
loop1:	beq $s1, $s2, exit
	lw $t0, ($s0)
	rem $t1, $t0, 2
	
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	
	beq $t1, $0, chan
	beq $t1, 1, le
	
le:	add $s4, $s4, $t0
	j loop1
	
chan:	add $s3, $s3, $t0
	j loop1

exit:	li $v0, 4
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
