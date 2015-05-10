	.globl main
main:
	addi $t1,$sp,0
	addi $sp,$sp,-4000
	addi $t2,$sp,0
	addi $t2,$t2,-4000
	la $t3, HEAPPTR
	sw $t2,0($t3)
	sw $ra,4($sp)
	jal main1
	li $v0, 10
	syscall
main1:
	sw $fp, -20($sp)
	sw $sp, -24($sp)
	sw $ra, -28($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -32
	addi $sp, $sp, -4
	li , $t0, 3
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -8($fp)
	addi $sp, $sp, -4
	li , $t0, 10
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, -4($fp)
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest1
forstart1:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	li , $t0, 3
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest1:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart1
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest3
forstart3:
	li , $t0, 0
	sw $t0, -16($fp)
	j fortest2
forstart2:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -16($fp)
	addi $t0, $t0, 1
	sw $t0, -16($fp)
fortest2:
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart2
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest3:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart3
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest5
forstart5:
	li , $t0, 0
	sw $t0, -16($fp)
	j fortest4
forstart4:
	addi $sp, $sp, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, -16($fp)
	addi $t0, $t0, 1
	sw $t0, -16($fp)
fortest4:
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest5:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart5
main2:
	lw $ra, -28($fp)
	lw $sp, -24($fp)
	lw $fp, -20($fp)
	jr $ra
Print:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	li $v0,4
	la $a0, sp
	syscall
	jr $ra
Println:
	li $v0,4
	la $a0, cr
	syscall
	jr $ra
Read:
	li $v0,5
	syscall
	jr $ra
allocate:
	la $t2, HEAPPTR
	lw $v0,0($t2)
	lw $t3, 4($sp)
	sub $t3,$v0,$t3
	sw $t3,0($t2)
	jr $ra
	.data
cr:
	.asciiz "\n"
sp:
	.asciiz " "
HEAPPTR:
	.word 0
