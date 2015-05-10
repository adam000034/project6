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
	sw $fp, -8($sp)
	sw $sp, -12($sp)
	sw $ra, -16($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -20
	addi $sp, $sp, -4
	li , $t0, 8
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	addi $sp, $sp, -4
	li , $t0, 8
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -4($fp)
	lw $t0, 0($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 0($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 2
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -4($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -4($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	lw $t0, 0($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	lw $t0, -4($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, -4
	lw $t0, -4($fp)
	lw $t0, 0($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, -4
	lw $t0, -4($fp)
	lw $t0, -4($t0)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
main2:
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
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
