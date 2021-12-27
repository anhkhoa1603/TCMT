.data
	input:		.asciiz	"n: "
	output1:	.asciiz	"Khong phai so hoan thien!"
	output2:	.asciiz "Day la so hoan thien!"
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
	li $t1, 0
	
loop1:	addi $t1, $t1, 1
	bgt $t1, $t0, Check
	rem $t2, $s0, $t1
	bne $t2, 0, loop1
	add $t3, $t3, $t1
	j loop1
	
Check:	bne $s0, $t3, out
	li $s1, 1
	jr $ra
	
out:	li $s1, 0
	jr $ra
.end check