.data
	input1:		.asciiz	"x: "
	input2:		.asciiz	"y: "
	output:		.asciiz	"Min= "
	output1:	.asciiz	"Hai so bang nhau!"
.text
.globl main
main:
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	jal minmax
	
	
	beq $s2, $0, out
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	j exit
	
out:	li $v0, 4
	la $a0, output1
	syscall
	
exit:	li $v0, 10
	syscall
.end	

.globl minmax
.ent minmax
minmax:
	blt $s0, $s1, minx
	bgt $s0, $s1, miny
	j equal
minx:	move $s2, $s0
	j end
miny:	move $s2, $s1
	j end
equal:	li $s2, 0

end:	jr $ra

.end minmax