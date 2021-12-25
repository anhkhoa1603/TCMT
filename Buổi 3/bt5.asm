.data
	mang:		.word	0
	n:		.word 	0
	msgnhap1:	.asciiz "Nhap N: "
	msgnhap2:	.asciiz "Nhap mang: \n"
	msgxuat1:	.asciiz	"\nTruoc: "
	msgxuat2:	.asciiz "\nSau: "
	msg_kc:		.asciiz " "
.text
.globl main
main:
	li $v0, 4
	la $a0, msgnhap1
	syscall
	
	li $v0, 5
	syscall #nhap N
	sw $v0, n
	lw $s7, n #$s7 = N
	
	li $v0, 4
	la $a0, msgnhap2
	syscall
	
	la $s0, mang
	li $s1, 0
	
nhap:	li $v0, 5 #nhap mang nh? thuong
	syscall
	sw $v0, ($s0)
	
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s7, nhap

	li $v0, 4
	la $a0, msgxuat1
	syscall
	
	la $s0, mang
	li $s1, 0

xuat1:	li $v0, 1 #xuat mang truoc khi sap xep
	lw $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, msg_kc
	syscall
	
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s7, xuat1
	
	li $s1, 0 #i = 0
	
loop1:	beq $s1, $s7, exit #i = n thi nhay toi exit
	
	la $s0, mang
	li $s2, 0 #j = 0
	sub $t9, $s7, $s1 #$t9 = n - i
	
loop2:	beq $s2, $t9, ex_lo1 #j = n - i thi nhay toi ex_lo2
	lw $t0, ($s0) #a[j]
	addi $s0, $s0, 4 #tien a toi 4 don vi
	lw $t1, ($s0)#a[j + 1]
	ble $t0, $t1, ex_lo2 # a[j] > a[j + 1] thi doi vij tri cho nhau
	move $t2, $t0 #x = X[j]
	move $t0, $t1 #X[j] = X[j + 1]
	move $t1, $t2 #X[j + ]] = x
	
ex_lo2:	sw $t1, ($s0) #luu a[j + 1] moi(neu co doi)
	subi $s0, $s0, 4 #lui a ve 4 don vi
	sw $t0, ($s0) #luu a[j] moi(neu co doi)
	
	addi $s2, $s2, 1 #j++
	addi $s0, $s0, 4 #tien a toi 4 don vi
	
	j loop2 #nhay len loop2
	
ex_lo1: addi $s1, $s1, 1 #i++

	j loop1 #nhay len loop1
	
exit:	la $s0, mang
	li $s1, 0
			
	li $v0, 4
	la $a0, msgxuat2
	syscall

xuat2:	li $v0, 1 #xuat mang sau khi sap xep
	lw $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, msg_kc
	syscall
	
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	blt $s1, $s7, xuat2
	
	li $v0, 10
	syscall
