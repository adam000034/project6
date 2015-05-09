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
PrintBoolean1:
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
	lw $t0, 4($fp)
	beq $t0, 1, iftrue1
	addi $sp, $sp, -4
	li , $t0, 0
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	j ifend1
iftrue1:
	addi $sp, $sp, -4
	li , $t0, 1
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
ifend1:
PrintBoolean2:
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
MakeBool1:
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
	#NEW MOVE
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	addi $v0, $t0, 0
	j MakeBool2
MakeBool2:
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
main1:
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $fp, 0
	sw $t0, -16($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $sp, 0
	sw $t0, -20($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $ra, 0
	sw $t0, -24($sp)
	#NEW MOVE
	addi $t0, $sp, 0
	addi $fp, $t0, 0
	#NEW MOVE
	addi $t0, $sp, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 28
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $sp, $t0, 0
	j whiletest1
whilestart1:
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
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sle $t0, $t2, $t0
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal MakeBool1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -8($fp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $sp, $sp, -4
	lw $t0, -4($fp)
	sw $t0, 4($sp)
	jal MakeBool1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -12($fp)
	addi $sp, $sp, -4
	lw $t0, -8($fp)
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -12($fp)
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -8($fp)
	beq $t0, 1, ntruelabel1
	li, $t0, 1
	j nendlabel1
ntruelabel1:
	li , $t0, 0
nendlabel1:
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -12($fp)
	beq $t0, 1, ntruelabel2
	li, $t0, 1
	j nendlabel2
ntruelabel2:
	li , $t0, 0
nendlabel2:
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel1
	beq $t0, 0, andfalselabel1
	li , $t0, 1
	j andendlabel1
andfalselabel1:
	li , $t0, 0
andendlabel1:
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel1
	beq $t0, 1, ortruelabel1
	li , $t0, 0
	j orendlabel1
ortruelabel1:
	li , $t0, 1
orendlabel1:
	sw $t0, 4($sp)
	jal PrintBoolean1
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
whiletest1:
	li , $t0, 1
	beq $t0, 1, whilestart1
main2:
	#NEW MOVE
	lw $t0, -24($fp)
	addi $ra, $t0, 0
	#NEW MOVE
	lw $t0, -20($fp)
	addi $sp, $t0, 0
	#NEW MOVE
	lw $t0, -16($fp)
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
