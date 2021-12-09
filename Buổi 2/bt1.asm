.data
	msg:	.asciiz	"Tong cac so tu 1 toi N\n"
	input:	.asciiz	"Nhap N "
	output:	.asciiz	"Ket qua: "
.text
.globl main
main:
	li $v0, 4
	la $a0, msg
	syscall # Xuat de ba
	
	li $v0, 4
	la $a0, input
	syscall # Xuat input
	
	li $v0, 5
	syscall # nhap N
	move $t0, $v0
	
	li $t1, 1 # gan i = 1
loop:	bgt $t1, $t0, exit # i > n => exit
	add $t2, $t2, $t1 # sum = sum + i
	add $t1, $t1, 1 # i++
	j loop
	
exit: 	li $v0, 4
	la $a0, output
	syscall # Xuat output

	li $v0, 1
	move $a0, $t2
	syscall # Xuat ket qua

	li $v0, 10
	syscall # Ngung chuong trinh