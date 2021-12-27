.data
	input:		.asciiz	"n: "
	output1:	.asciiz	"Khong phai so nguyen to!"
	output2:	.asciiz "Day la so nguyen to!"
.text
.globl main
main:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	jal check
	
	beq $s1, 1, r
	
	li $v0, 4
	la $a0, output1
	syscall
	j exit
	
r:	li $v0, 4
	la $a0, output2
	syscall
	
exit:	li $v0, 10
	syscall
.end

.globl check
.ent check
check:
	div $t0, $s0, 2
	li $t1, 2
	
loop:	bgt $t1, $t0, out1
	rem $t2, $s0, $t1
	beq $t2, 0, out
	addi $t1, $t1, 1
	j loop
	
out1:	li $s1, 1
	jr $ra
	
out:	li $s1, 0
	jr $ra
.end check