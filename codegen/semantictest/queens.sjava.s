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
	sw $t0, -8($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $sp, 0
	sw $t0, -12($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $ra, 0
	sw $t0, -16($sp)
	#NEW MOVE
	addi $t0, $sp, 0
	addi $fp, $t0, 0
	#NEW MOVE
	addi $t0, $sp, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 20
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
	addi $sp, $sp, -4
	lw $t0, 0($fp)
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
	sw $t0, -4($fp)
	addi $sp, $sp, -12
	li , $t0, 1
	sw $t0, 4($sp)
	lw $t0, -4($fp)
	sw $t0, 8($sp)
	lw $t0, 0($fp)
	sw $t0, 12($sp)
	jal Solve1
	addi $sp, $sp, 12
main2:
	#NEW MOVE
	lw $t0, -16($fp)
	addi $ra, $t0, 0
	#NEW MOVE
	lw $t0, -12($fp)
	addi $sp, $t0, 0
	#NEW MOVE
	lw $t0, -8($fp)
	addi $fp, $t0, 0
	jr $ra
PrintBoard1:
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $fp, 0
	sw $t0, -8($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $sp, 0
	sw $t0, -12($sp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	addi $t0, $ra, 0
	sw $t0, -16($sp)
	#NEW MOVE
	addi $t0, $sp, 0
	addi $fp, $t0, 0
	#NEW MOVE
	addi $t0, $sp, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 20
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $sp, $t0, 0
	#NEW MOVE
	#BIGGEST MOVE TILE
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest3
forstart3:
	#NEW MOVE
	#BIGGEST MOVE TILE
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest1
forstart1:
	addi $sp, $sp, -4
	li , $t0, 0
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -4($fp)
fortest1:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart1
	addi $sp, $sp, -4
	li , $t0, 1
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
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
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -4($fp)
	j fortest2
forstart2:
	addi $sp, $sp, -4
	li , $t0, 0
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -4($fp)
fortest2:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart2
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($fp)
fortest3:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart3
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
PrintBoard2:
	#NEW MOVE
	lw $t0, -16($fp)
	addi $ra, $t0, 0
	#NEW MOVE
	lw $t0, -12($fp)
	addi $sp, $t0, 0
	#NEW MOVE
	lw $t0, -8($fp)
	addi $fp, $t0, 0
	jr $ra
Abs1:
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue1
	#NEW MOVE
	li , $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $v0, $t0, 0
	j Abs2
	j ifend1
iftrue1:
	#NEW MOVE
	lw $t0, 4($fp)
	addi $v0, $t0, 0
	j Abs2
ifend1:
Abs2:
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
Legal1:
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
	li , $t0, 1
	sw $t0, -8($fp)
	#NEW MOVE
	#BIGGEST MOVE TILE
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest5
forstart5:
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -4($fp)
	j fortest4
forstart4:
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 4($sp)
	jal Abs1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 4($sp)
	jal Abs1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel1
	beq $t0, 1, ortruelabel1
	li , $t0, 0
	j orendlabel1
ortruelabel1:
	li , $t0, 1
orendlabel1:
	beq $t0, 1, iftrue2
	j ifend2
iftrue2:
	#NEW MOVE
	#BIGGEST MOVE TILE
	li , $t0, 0
	sw $t0, -8($fp)
ifend2:
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -4($fp)
fortest4:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart4
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($fp)
fortest5:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart5
	#NEW MOVE
	lw $t0, -8($fp)
	addi $v0, $t0, 0
	j Legal2
Legal2:
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
Solve1:
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
	lw $t0, 12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	beq $t0, 1, iftrue4
	#NEW MOVE
	#BIGGEST MOVE TILE
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest6
forstart6:
	#NEW MOVE
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	jal Legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, iftrue3
	j ifend3
iftrue3:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal Solve1
	addi $sp, $sp, 12
ifend3:
	#NEW MOVE
	#BIGGEST MOVE TILE
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($fp)
fortest6:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart6
	j ifend4
iftrue4:
	addi $sp, $sp, -8
	lw $t0, 8($fp)
	sw $t0, 4($sp)
	lw $t0, 12($fp)
	sw $t0, 8($sp)
	jal PrintBoard1
	addi $sp, $sp, 8
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
ifend4:
Solve2:
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
