.data
	msg:		.asciiz	"Tong cac so tu a toi b\n"
	input1:		.asciiz "Nhap a: "
	input2:		.asciiz "Nhap b: "
	output1:	.asciiz "Khong hop le, moi nhap lai!\n"
	output2:	.asciiz "Ket qua: "
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
	
loop1:	bgt $t0, $0, cout
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	j loop1
	
cout:	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
loop2:	bgt $t1, $0, loop3
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	j loop2
	
	add $t2, $0, $0
	
loop3:	bgt $t0, $t1, exit
	add $t2, $t2, $t0
	add $t0, $t0, 1
	j loop3
	
exit: 	li $v0, 4
	la $a0, output2
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 10
	syscall