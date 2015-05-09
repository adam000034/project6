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
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $fp, 0
	sw $t0, -12($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $sp, 0
	sw $t0, -16($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $ra, 0
	sw $t0, -20($sp)
	#NEW MOVE
	addi $t0, $sp, 0
	addi $fp, $t0, 0
	#NEW MOVE
	addi $t0, $sp, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 24
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $sp, $t0, 0
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, -4($fp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $sp, $sp, -8
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	lw $t0, -4($fp)
	sw $t0, 8($sp)
	jal GCD1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	sw $t0, -8($fp)
	addi $sp, $sp, -4
	lw $t0, -8($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
main2:
	#NEW MOVE
	lw $t0, -20($fp)
	addi $ra, $t0, 0
	#NEW MOVE
	lw $t0, -16($fp)
	addi $sp, $t0, 0
	#NEW MOVE
	lw $t0, -12($fp)
	addi $fp, $t0, 0
	jr $ra
mod1:
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $fp, 0
	sw $t0, 0($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $sp, 0
	sw $t0, -4($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $ra, 0
	sw $t0, -8($sp)
	#NEW MOVE
	addi $t0, $sp, 0
	addi $fp, $t0, 0
	#NEW MOVE
	addi $t0, $sp, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 12
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $sp, $t0, 0
	j whiletest1
whilestart1:
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 4($fp)
whiletest1:
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, whilestart1
	#NEW MOVE
	lw $t0, 4($fp)
	addi $v0, $t0, 0
	j mod2
mod2:
	#NEW MOVE
	lw $t0, -8($fp)
	addi $ra, $t0, 0
	#NEW MOVE
	lw $t0, -4($fp)
	addi $sp, $t0, 0
	#NEW MOVE
	lw $t0, 0($fp)
	addi $fp, $t0, 0
	jr $ra
GCD1:
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $fp, 0
	sw $t0, -4($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $sp, 0
	sw $t0, -8($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $ra, 0
	sw $t0, -12($sp)
	#NEW MOVE
	addi $t0, $sp, 0
	addi $fp, $t0, 0
	#NEW MOVE
	addi $t0, $sp, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 16
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $sp, $t0, 0
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, iftrue1
	j ifend1
iftrue1:
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 4($fp)
	sw $t0, 0($fp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 8($fp)
	sw $t0, 4($fp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 0($fp)
	sw $t0, 8($fp)
ifend1:
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue2
	#NEW MOVE
	addi $sp, $sp, -8
	lw $t0, 8($fp)
	sw $t0, 4($sp)
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	jal mod1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	sw $t0, 8($sp)
	jal GCD1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	addi $v0, $t0, 0
	j GCD2
	j ifend2
iftrue2:
	#NEW MOVE
	lw $t0, 4($fp)
	addi $v0, $t0, 0
	j GCD2
ifend2:
GCD2:
	#NEW MOVE
	lw $t0, -12($fp)
	addi $ra, $t0, 0
	#NEW MOVE
	lw $t0, -8($fp)
	addi $sp, $t0, 0
	#NEW MOVE
	lw $t0, -4($fp)
	addi $fp, $t0, 0
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
