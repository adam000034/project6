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
factorial1:
	sw $fp, 0($sp)
	sw $sp, -4($sp)
	sw $ra, -8($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue1
	j ifend1
iftrue1:
	li $v0, 1
	j factorial2
ifend1:
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	subi $t0, $t0, 1
	sw $t0, 4($sp)
	jal factorial1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $v0, $t0, 0
	j factorial2
factorial2:
	lw $ra, -8($fp)
	lw $sp, -4($fp)
	lw $fp, 0($fp)
	jr $ra
main1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	addi $sp, $sp, -4
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 4($sp)
	jal factorial1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
main2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
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
