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
	sw $fp, -28($sp)
	sw $sp, -32($sp)
	sw $ra, -36($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -40
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
	li , $t0, 8
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -20($fp)
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
	lw $t0, 0($fp)
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
	lw $t0, -12($fp)
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
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart1
	addi $sp, $sp, -4
	li , $t0, 8
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -24($fp)
	li , $t0, 0
	sw $t0, -12($fp)
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
fortest2:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart2
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest4
forstart4:
	li , $t0, 0
	sw $t0, -16($fp)
	j fortest3
forstart3:
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
fortest3:
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart3
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest4:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart4
	lw $t0, -20($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -20($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 101
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -24($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 102
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -24($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 103
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest6
forstart6:
	li , $t0, 0
	sw $t0, -16($fp)
	j fortest5
forstart5:
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
fortest5:
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart5
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest6:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart6
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest7
forstart7:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
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
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest7:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart7
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	li , $t0, 0
	sw $t0, -12($fp)
	j fortest8
forstart8:
	addi $sp, $sp, -4
	lw $t0, -4($fp)
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
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
fortest8:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart8
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, -4
	lw $t0, -20($fp)
	lw $t0, 0($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -20($fp)
	lw $t0, -4($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -24($fp)
	lw $t0, 0($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -24($fp)
	lw $t0, -4($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
main2:
	lw $ra, -36($fp)
	lw $sp, -32($fp)
	lw $fp, -28($fp)
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
