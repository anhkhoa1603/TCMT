.data
	mang:		.word	0
	n:		.word 	0
	msgnhap1:	.asciiz "Nhap N: "
	msgnhap2:	.asciiz "Nhap mang: \n"
	msgxuat1:	.asciiz	"Tong: "
	msgxuat2:	.asciiz "\nTrung binh cac so: "
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
	li $s3, 0 #Tong = 0
	li $s4, 0 # Tb = 0

loop1:	lw $t0, ($s0)
	add $s3, $s3, $t0
	
	addi  $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s2, loop1
	
	mtc1 $s3, $f1
	cvt.s.w $f1,$f1
	
	mtc1 $s1, $f2
	cvt.s.w $f2,$f2
	
	div.s $f3, $f1, $f2
	
	li $v0, 4
	la $a0, msgxuat1
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, msgxuat2
	syscall
	
	li $v0, 2
	mov.s $f12, $f3
	syscall
	
	li $v0, 10
	syscall
