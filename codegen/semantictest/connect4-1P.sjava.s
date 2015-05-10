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
	sw $fp, -32($sp)
	sw $sp, -36($sp)
	sw $ra, -40($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -44
	li , $t0, 0
	sw $t0, -8($fp)
	li , $t0, 1
	sw $t0, -12($fp)
	li , $t0, 0
	sw $t0, -20($fp)
	li , $t0, 0
	sw $t0, -24($fp)
	addi $sp, $sp, -4
	li , $t0, 8
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -28($fp)
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
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest1
forstart1:
	lw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
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
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest1:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart1
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal ClearBoard1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal PrintBoard1
	addi $sp, $sp, 4
	j whiletest1
whilestart1:
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue1
	addi $sp, $sp, -12
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	li , $t0, 2
	sw $t0, 8($sp)
	lw $t0, -28($fp)
	sw $t0, 12($sp)
	jal min1
	addi $sp, $sp, 12
	lw $t0, -28($fp)
	lw $t0, 0($t0)
	sw $t0, -16($fp)
	j ifend1
iftrue1:
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
dowhilestart1:
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, -16($fp)
dowhiletest1:
	addi $sp, $sp, -8
	lw $t0, -16($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	jal legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, ntruelabel1
	li, $t0, 1
	j nendlabel1
ntruelabel1:
	li , $t0, 0
nendlabel1:
	beq $t0, 1, dowhilestart1
ifend1:
	addi $sp, $sp, -12
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	lw $t0, -16($fp)
	sw $t0, 8($sp)
	lw $t0, -12($fp)
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal PrintBoard1
	addi $sp, $sp, 4
	lw $t0, -20($fp)
	addi $t0, $t0, 1
	sw $t0, -20($fp)
	addi $sp, $sp, -8
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	lw $t0, -16($fp)
	sw $t0, 8($sp)
	jal win1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, iftrue2
	j ifend2
iftrue2:
	li , $t0, 1
	sw $t0, -8($fp)
	lw $t0, -12($fp)
	sw $t0, -24($fp)
ifend2:
	lw $t0, -20($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue3
	j ifend3
iftrue3:
	li , $t0, 1
	sw $t0, -8($fp)
	li , $t0, 0
	sw $t0, -24($fp)
ifend3:
	addi $sp, $sp, -4
	lw $t0, -12($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -12($fp)
whiletest1:
	lw $t0, -8($fp)
	beq $t0, 1, ntruelabel2
	li, $t0, 1
	j nendlabel2
ntruelabel2:
	li , $t0, 0
nendlabel2:
	beq $t0, 1, whilestart1
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, -4
	lw $t0, -24($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
main2:
	lw $ra, -40($fp)
	lw $sp, -36($fp)
	lw $fp, -32($fp)
	jr $ra
value1:
	sw $fp, -56($sp)
	sw $sp, -60($sp)
	sw $ra, -64($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -68
	li , $t0, 0
	sw $t0, -8($fp)
	li , $t0, 0
	sw $t0, -12($fp)
	li , $t0, 0
	sw $t0, -16($fp)
	li , $t0, 0
	sw $t0, -20($fp)
	li , $t0, 0
	sw $t0, -24($fp)
	li , $t0, 0
	sw $t0, -28($fp)
	li , $t0, 0
	sw $t0, -32($fp)
	li , $t0, 0
	sw $t0, -36($fp)
	li , $t0, 0
	sw $t0, -40($fp)
	li , $t0, 0
	sw $t0, -44($fp)
	li , $t0, 0
	sw $t0, -48($fp)
	li , $t0, 0
	sw $t0, -52($fp)
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest3
forstart3:
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest2
forstart2:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 1
	sw $t0, 16($sp)
	jal open11
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -8($fp)
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 2
	sw $t0, 16($sp)
	jal open11
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -12($fp)
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 1
	sw $t0, 16($sp)
	jal half_open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -16($fp)
	lw $t0, -20($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 2
	sw $t0, 16($sp)
	jal half_open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -20($fp)
	lw $t0, -24($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 1
	sw $t0, 16($sp)
	jal open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -24($fp)
	lw $t0, -28($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 2
	sw $t0, 16($sp)
	jal open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -28($fp)
	lw $t0, -32($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 1
	sw $t0, 16($sp)
	jal half_open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -32($fp)
	lw $t0, -36($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 2
	sw $t0, 16($sp)
	jal half_open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -36($fp)
	lw $t0, -40($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 1
	sw $t0, 16($sp)
	jal open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -40($fp)
	lw $t0, -44($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 2
	sw $t0, 16($sp)
	jal open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -44($fp)
	lw $t0, -48($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 1
	sw $t0, 16($sp)
	jal four1
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -48($fp)
	lw $t0, -52($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, -4($fp)
	sw $t0, 12($sp)
	li , $t0, 2
	sw $t0, 16($sp)
	jal four1
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -52($fp)
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest2:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart2
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest3:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart3
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -24($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -32($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 20
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -40($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 500
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -48($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -20($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -28($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -36($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 20
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -44($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 500
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -52($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $v0, $t0, 0
	j value2
value2:
	lw $ra, -64($fp)
	lw $sp, -60($fp)
	lw $fp, -56($fp)
	jr $ra
legal1:
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
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel1
	beq $t0, 1, ortruelabel1
	li , $t0, 0
	j orendlabel1
ortruelabel1:
	li , $t0, 1
orendlabel1:
	beq $t0, 1, iftrue4
	j ifend4
iftrue4:
	li $v0, 0
	j legal2
ifend4:
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
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
	lw $t0, 4($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	beq $t0, 1, iftrue5
	j ifend5
iftrue5:
	li $v0, 0
	j legal2
ifend5:
	li $v0, 1
	j legal2
legal2:
	lw $ra, -8($fp)
	lw $sp, -4($fp)
	lw $fp, 0($fp)
	jr $ra
ClearBoard1:
	sw $fp, -8($sp)
	sw $sp, -12($sp)
	sw $ra, -16($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -20
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest5
forstart5:
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest4
forstart4:
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest4:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart4
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest5:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart5
ClearBoard2:
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
	jr $ra
PrintBoard1:
	sw $fp, -8($sp)
	sw $sp, -12($sp)
	sw $ra, -16($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -20
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest7
forstart7:
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest6
forstart6:
	addi $sp, $sp, -4
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
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest6:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart6
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest7:
	lw $t0, 0($fp)
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
	sw $t0, 0($fp)
	j fortest8
forstart8:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest8:
	lw $t0, 0($fp)
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
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
PrintBoard2:
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
	jr $ra
swap1:
	sw $fp, 0($sp)
	sw $sp, -4($sp)
	sw $ra, -8($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue6
	li $v0, 1
	j swap2
	j ifend6
iftrue6:
	li $v0, 2
	j swap2
ifend6:
swap2:
	lw $ra, -8($fp)
	lw $sp, -4($fp)
	lw $fp, 0($fp)
	jr $ra
DoMove1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 1
	sw $t0, 0($fp)
	j fortest9
forstart9:
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
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	beq $t0, 1, iftrue7
	j ifend7
iftrue7:
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	subi $t0, $t0, 1
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
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 12($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	li $v0, 0
	j DoMove2
ifend7:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest9:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart9
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
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
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 12($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
DoMove2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
UndoMove1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest10
forstart10:
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
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	beq $t0, 1, iftrue8
	j ifend8
iftrue8:
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
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	li $v0, 0
	j UndoMove2
ifend8:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest10:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart10
UndoMove2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
win1:
	sw $fp, -16($sp)
	sw $sp, -20($sp)
	sw $ra, -24($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -28
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest11
forstart11:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest11:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel1
	beq $t0, 0, andfalselabel1
	li , $t0, 1
	j andendlabel1
andfalselabel1:
	li , $t0, 0
andendlabel1:
	beq $t0, 1, forstart11
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue9
	j ifend9
iftrue9:
	li $v0, 0
	j win2
ifend9:
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
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	sw $t0, -8($fp)
	li , $t0, 0
	sw $t0, -4($fp)
	li , $t0, 0
	sw $t0, -12($fp)
	j whiletest2
whilestart2:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest2:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart2
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue10
	j ifend10
iftrue10:
	li $v0, 1
	j win2
ifend10:
	li , $t0, 0
	sw $t0, -4($fp)
	li , $t0, 0
	sw $t0, -12($fp)
	j whiletest3
whilestart3:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest3:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart3
	li , $t0, 1
	sw $t0, -12($fp)
	j whiletest4
whilestart4:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest4:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue11
	j ifend11
iftrue11:
	li $v0, 1
	j win2
ifend11:
	li , $t0, 0
	sw $t0, -12($fp)
	li , $t0, 0
	sw $t0, -4($fp)
	j whiletest5
whilestart5:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest5:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart5
	li , $t0, 1
	sw $t0, -12($fp)
	j whiletest6
whilestart6:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest6:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart6
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue12
	j ifend12
iftrue12:
	li $v0, 1
	j win2
ifend12:
	li , $t0, 0
	sw $t0, -12($fp)
	li , $t0, 0
	sw $t0, -4($fp)
	j whiletest7
whilestart7:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest7:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart7
	li , $t0, 1
	sw $t0, -12($fp)
	j whiletest8
whilestart8:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	lw $t0, -12($fp)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest8:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 8($sp)
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, whilestart8
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue13
	j ifend13
iftrue13:
	li $v0, 1
	j win2
ifend13:
	li $v0, 0
	j win2
win2:
	lw $ra, -24($fp)
	lw $sp, -20($fp)
	lw $fp, -16($fp)
	jr $ra
GetBoard1:
	sw $fp, 0($sp)
	sw $sp, -4($sp)
	sw $ra, -8($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -12
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel2
	beq $t0, 1, ortruelabel2
	li , $t0, 0
	j orendlabel2
ortruelabel2:
	li , $t0, 1
orendlabel2:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel3
	beq $t0, 1, ortruelabel3
	li , $t0, 0
	j orendlabel3
ortruelabel3:
	li , $t0, 1
orendlabel3:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel4
	beq $t0, 1, ortruelabel4
	li , $t0, 0
	j orendlabel4
ortruelabel4:
	li , $t0, 1
orendlabel4:
	beq $t0, 1, iftrue14
	j ifend14
iftrue14:
	li $v0, 3
	j GetBoard2
ifend14:
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j GetBoard2
GetBoard2:
	lw $ra, -8($fp)
	lw $sp, -4($fp)
	lw $fp, 0($fp)
	jr $ra
open11:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue15
	j ifend15
iftrue15:
	li $v0, 0
	j open12
ifend15:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel2
	beq $t0, 0, andfalselabel2
	li , $t0, 1
	j andendlabel2
andfalselabel2:
	li , $t0, 0
andendlabel2:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel3
	beq $t0, 0, andfalselabel3
	li , $t0, 1
	j andendlabel3
andfalselabel3:
	li , $t0, 0
andendlabel3:
	beq $t0, 1, iftrue16
	j ifend16
iftrue16:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend16:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel4
	beq $t0, 0, andfalselabel4
	li , $t0, 1
	j andendlabel4
andfalselabel4:
	li , $t0, 0
andendlabel4:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel5
	beq $t0, 0, andfalselabel5
	li , $t0, 1
	j andendlabel5
andfalselabel5:
	li , $t0, 0
andendlabel5:
	beq $t0, 1, iftrue17
	j ifend17
iftrue17:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend17:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel6
	beq $t0, 0, andfalselabel6
	li , $t0, 1
	j andendlabel6
andfalselabel6:
	li , $t0, 0
andendlabel6:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel7
	beq $t0, 0, andfalselabel7
	li , $t0, 1
	j andendlabel7
andfalselabel7:
	li , $t0, 0
andendlabel7:
	beq $t0, 1, iftrue18
	j ifend18
iftrue18:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend18:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel8
	beq $t0, 0, andfalselabel8
	li , $t0, 1
	j andendlabel8
andfalselabel8:
	li , $t0, 0
andendlabel8:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel9
	beq $t0, 0, andfalselabel9
	li , $t0, 1
	j andendlabel9
andfalselabel9:
	li , $t0, 0
andendlabel9:
	beq $t0, 1, iftrue19
	j ifend19
iftrue19:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend19:
	lw $v0, 0($fp)
	j open12
open12:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
half_open21:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue20
	j ifend20
iftrue20:
	li $v0, 0
	j half_open22
ifend20:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel5
	beq $t0, 1, ortruelabel5
	li , $t0, 0
	j orendlabel5
ortruelabel5:
	li , $t0, 1
orendlabel5:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel10
	beq $t0, 0, andfalselabel10
	li , $t0, 1
	j andendlabel10
andfalselabel10:
	li , $t0, 0
andendlabel10:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel11
	beq $t0, 0, andfalselabel11
	li , $t0, 1
	j andendlabel11
andfalselabel11:
	li , $t0, 0
andendlabel11:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel12
	beq $t0, 0, andfalselabel12
	li , $t0, 1
	j andendlabel12
andfalselabel12:
	li , $t0, 0
andendlabel12:
	beq $t0, 1, iftrue21
	j ifend21
iftrue21:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend21:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel6
	beq $t0, 1, ortruelabel6
	li , $t0, 0
	j orendlabel6
ortruelabel6:
	li , $t0, 1
orendlabel6:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel13
	beq $t0, 0, andfalselabel13
	li , $t0, 1
	j andendlabel13
andfalselabel13:
	li , $t0, 0
andendlabel13:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel14
	beq $t0, 0, andfalselabel14
	li , $t0, 1
	j andendlabel14
andfalselabel14:
	li , $t0, 0
andendlabel14:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel15
	beq $t0, 0, andfalselabel15
	li , $t0, 1
	j andendlabel15
andfalselabel15:
	li , $t0, 0
andendlabel15:
	beq $t0, 1, iftrue22
	j ifend22
iftrue22:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend22:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel7
	beq $t0, 1, ortruelabel7
	li , $t0, 0
	j orendlabel7
ortruelabel7:
	li , $t0, 1
orendlabel7:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel16
	beq $t0, 0, andfalselabel16
	li , $t0, 1
	j andendlabel16
andfalselabel16:
	li , $t0, 0
andendlabel16:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel17
	beq $t0, 0, andfalselabel17
	li , $t0, 1
	j andendlabel17
andfalselabel17:
	li , $t0, 0
andendlabel17:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel18
	beq $t0, 0, andfalselabel18
	li , $t0, 1
	j andendlabel18
andfalselabel18:
	li , $t0, 0
andendlabel18:
	beq $t0, 1, iftrue23
	j ifend23
iftrue23:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend23:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel8
	beq $t0, 1, ortruelabel8
	li , $t0, 0
	j orendlabel8
ortruelabel8:
	li , $t0, 1
orendlabel8:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel19
	beq $t0, 0, andfalselabel19
	li , $t0, 1
	j andendlabel19
andfalselabel19:
	li , $t0, 0
andendlabel19:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel20
	beq $t0, 0, andfalselabel20
	li , $t0, 1
	j andendlabel20
andfalselabel20:
	li , $t0, 0
andendlabel20:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel21
	beq $t0, 0, andfalselabel21
	li , $t0, 1
	j andendlabel21
andfalselabel21:
	li , $t0, 0
andendlabel21:
	beq $t0, 1, iftrue24
	j ifend24
iftrue24:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend24:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel22
	beq $t0, 0, andfalselabel22
	li , $t0, 1
	j andendlabel22
andfalselabel22:
	li , $t0, 0
andendlabel22:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel23
	beq $t0, 0, andfalselabel23
	li , $t0, 1
	j andendlabel23
andfalselabel23:
	li , $t0, 0
andendlabel23:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel9
	beq $t0, 1, ortruelabel9
	li , $t0, 0
	j orendlabel9
ortruelabel9:
	li , $t0, 1
orendlabel9:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel24
	beq $t0, 0, andfalselabel24
	li , $t0, 1
	j andendlabel24
andfalselabel24:
	li , $t0, 0
andendlabel24:
	beq $t0, 1, iftrue25
	j ifend25
iftrue25:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend25:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel25
	beq $t0, 0, andfalselabel25
	li , $t0, 1
	j andendlabel25
andfalselabel25:
	li , $t0, 0
andendlabel25:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel26
	beq $t0, 0, andfalselabel26
	li , $t0, 1
	j andendlabel26
andfalselabel26:
	li , $t0, 0
andendlabel26:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel10
	beq $t0, 1, ortruelabel10
	li , $t0, 0
	j orendlabel10
ortruelabel10:
	li , $t0, 1
orendlabel10:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel27
	beq $t0, 0, andfalselabel27
	li , $t0, 1
	j andendlabel27
andfalselabel27:
	li , $t0, 0
andendlabel27:
	beq $t0, 1, iftrue26
	j ifend26
iftrue26:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend26:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel28
	beq $t0, 0, andfalselabel28
	li , $t0, 1
	j andendlabel28
andfalselabel28:
	li , $t0, 0
andendlabel28:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel29
	beq $t0, 0, andfalselabel29
	li , $t0, 1
	j andendlabel29
andfalselabel29:
	li , $t0, 0
andendlabel29:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel11
	beq $t0, 1, ortruelabel11
	li , $t0, 0
	j orendlabel11
ortruelabel11:
	li , $t0, 1
orendlabel11:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel30
	beq $t0, 0, andfalselabel30
	li , $t0, 1
	j andendlabel30
andfalselabel30:
	li , $t0, 0
andendlabel30:
	beq $t0, 1, iftrue27
	j ifend27
iftrue27:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend27:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel31
	beq $t0, 0, andfalselabel31
	li , $t0, 1
	j andendlabel31
andfalselabel31:
	li , $t0, 0
andendlabel31:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel32
	beq $t0, 0, andfalselabel32
	li , $t0, 1
	j andendlabel32
andfalselabel32:
	li , $t0, 0
andendlabel32:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel12
	beq $t0, 1, ortruelabel12
	li , $t0, 0
	j orendlabel12
ortruelabel12:
	li , $t0, 1
orendlabel12:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel33
	beq $t0, 0, andfalselabel33
	li , $t0, 1
	j andendlabel33
andfalselabel33:
	li , $t0, 0
andendlabel33:
	beq $t0, 1, iftrue28
	j ifend28
iftrue28:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend28:
	lw $v0, 0($fp)
	j half_open22
half_open22:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
open21:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue29
	j ifend29
iftrue29:
	li $v0, 0
	j open22
ifend29:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel34
	beq $t0, 0, andfalselabel34
	li , $t0, 1
	j andendlabel34
andfalselabel34:
	li , $t0, 0
andendlabel34:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel35
	beq $t0, 0, andfalselabel35
	li , $t0, 1
	j andendlabel35
andfalselabel35:
	li , $t0, 0
andendlabel35:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel36
	beq $t0, 0, andfalselabel36
	li , $t0, 1
	j andendlabel36
andfalselabel36:
	li , $t0, 0
andendlabel36:
	beq $t0, 1, iftrue30
	j ifend30
iftrue30:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend30:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel37
	beq $t0, 0, andfalselabel37
	li , $t0, 1
	j andendlabel37
andfalselabel37:
	li , $t0, 0
andendlabel37:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel38
	beq $t0, 0, andfalselabel38
	li , $t0, 1
	j andendlabel38
andfalselabel38:
	li , $t0, 0
andendlabel38:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel39
	beq $t0, 0, andfalselabel39
	li , $t0, 1
	j andendlabel39
andfalselabel39:
	li , $t0, 0
andendlabel39:
	beq $t0, 1, iftrue31
	j ifend31
iftrue31:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend31:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel40
	beq $t0, 0, andfalselabel40
	li , $t0, 1
	j andendlabel40
andfalselabel40:
	li , $t0, 0
andendlabel40:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel41
	beq $t0, 0, andfalselabel41
	li , $t0, 1
	j andendlabel41
andfalselabel41:
	li , $t0, 0
andendlabel41:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel42
	beq $t0, 0, andfalselabel42
	li , $t0, 1
	j andendlabel42
andfalselabel42:
	li , $t0, 0
andendlabel42:
	beq $t0, 1, iftrue32
	j ifend32
iftrue32:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend32:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel43
	beq $t0, 0, andfalselabel43
	li , $t0, 1
	j andendlabel43
andfalselabel43:
	li , $t0, 0
andendlabel43:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel44
	beq $t0, 0, andfalselabel44
	li , $t0, 1
	j andendlabel44
andfalselabel44:
	li , $t0, 0
andendlabel44:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel45
	beq $t0, 0, andfalselabel45
	li , $t0, 1
	j andendlabel45
andfalselabel45:
	li , $t0, 0
andendlabel45:
	beq $t0, 1, iftrue33
	j ifend33
iftrue33:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend33:
	lw $v0, 0($fp)
	j open22
open22:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
half_open31:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue34
	j ifend34
iftrue34:
	li $v0, 0
	j half_open32
ifend34:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel13
	beq $t0, 1, ortruelabel13
	li , $t0, 0
	j orendlabel13
ortruelabel13:
	li , $t0, 1
orendlabel13:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel46
	beq $t0, 0, andfalselabel46
	li , $t0, 1
	j andendlabel46
andfalselabel46:
	li , $t0, 0
andendlabel46:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel47
	beq $t0, 0, andfalselabel47
	li , $t0, 1
	j andendlabel47
andfalselabel47:
	li , $t0, 0
andendlabel47:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel48
	beq $t0, 0, andfalselabel48
	li , $t0, 1
	j andendlabel48
andfalselabel48:
	li , $t0, 0
andendlabel48:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel49
	beq $t0, 0, andfalselabel49
	li , $t0, 1
	j andendlabel49
andfalselabel49:
	li , $t0, 0
andendlabel49:
	beq $t0, 1, iftrue35
	j ifend35
iftrue35:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend35:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel14
	beq $t0, 1, ortruelabel14
	li , $t0, 0
	j orendlabel14
ortruelabel14:
	li , $t0, 1
orendlabel14:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel50
	beq $t0, 0, andfalselabel50
	li , $t0, 1
	j andendlabel50
andfalselabel50:
	li , $t0, 0
andendlabel50:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel51
	beq $t0, 0, andfalselabel51
	li , $t0, 1
	j andendlabel51
andfalselabel51:
	li , $t0, 0
andendlabel51:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel52
	beq $t0, 0, andfalselabel52
	li , $t0, 1
	j andendlabel52
andfalselabel52:
	li , $t0, 0
andendlabel52:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel53
	beq $t0, 0, andfalselabel53
	li , $t0, 1
	j andendlabel53
andfalselabel53:
	li , $t0, 0
andendlabel53:
	beq $t0, 1, iftrue36
	j ifend36
iftrue36:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend36:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel15
	beq $t0, 1, ortruelabel15
	li , $t0, 0
	j orendlabel15
ortruelabel15:
	li , $t0, 1
orendlabel15:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel54
	beq $t0, 0, andfalselabel54
	li , $t0, 1
	j andendlabel54
andfalselabel54:
	li , $t0, 0
andendlabel54:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel55
	beq $t0, 0, andfalselabel55
	li , $t0, 1
	j andendlabel55
andfalselabel55:
	li , $t0, 0
andendlabel55:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel56
	beq $t0, 0, andfalselabel56
	li , $t0, 1
	j andendlabel56
andfalselabel56:
	li , $t0, 0
andendlabel56:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel57
	beq $t0, 0, andfalselabel57
	li , $t0, 1
	j andendlabel57
andfalselabel57:
	li , $t0, 0
andendlabel57:
	beq $t0, 1, iftrue37
	j ifend37
iftrue37:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend37:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel16
	beq $t0, 1, ortruelabel16
	li , $t0, 0
	j orendlabel16
ortruelabel16:
	li , $t0, 1
orendlabel16:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel58
	beq $t0, 0, andfalselabel58
	li , $t0, 1
	j andendlabel58
andfalselabel58:
	li , $t0, 0
andendlabel58:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel59
	beq $t0, 0, andfalselabel59
	li , $t0, 1
	j andendlabel59
andfalselabel59:
	li , $t0, 0
andendlabel59:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel60
	beq $t0, 0, andfalselabel60
	li , $t0, 1
	j andendlabel60
andfalselabel60:
	li , $t0, 0
andendlabel60:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel61
	beq $t0, 0, andfalselabel61
	li , $t0, 1
	j andendlabel61
andfalselabel61:
	li , $t0, 0
andendlabel61:
	beq $t0, 1, iftrue38
	j ifend38
iftrue38:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend38:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel62
	beq $t0, 0, andfalselabel62
	li , $t0, 1
	j andendlabel62
andfalselabel62:
	li , $t0, 0
andendlabel62:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel63
	beq $t0, 0, andfalselabel63
	li , $t0, 1
	j andendlabel63
andfalselabel63:
	li , $t0, 0
andendlabel63:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel64
	beq $t0, 0, andfalselabel64
	li , $t0, 1
	j andendlabel64
andfalselabel64:
	li , $t0, 0
andendlabel64:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel17
	beq $t0, 1, ortruelabel17
	li , $t0, 0
	j orendlabel17
ortruelabel17:
	li , $t0, 1
orendlabel17:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel65
	beq $t0, 0, andfalselabel65
	li , $t0, 1
	j andendlabel65
andfalselabel65:
	li , $t0, 0
andendlabel65:
	beq $t0, 1, iftrue39
	j ifend39
iftrue39:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend39:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel66
	beq $t0, 0, andfalselabel66
	li , $t0, 1
	j andendlabel66
andfalselabel66:
	li , $t0, 0
andendlabel66:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel67
	beq $t0, 0, andfalselabel67
	li , $t0, 1
	j andendlabel67
andfalselabel67:
	li , $t0, 0
andendlabel67:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel68
	beq $t0, 0, andfalselabel68
	li , $t0, 1
	j andendlabel68
andfalselabel68:
	li , $t0, 0
andendlabel68:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel18
	beq $t0, 1, ortruelabel18
	li , $t0, 0
	j orendlabel18
ortruelabel18:
	li , $t0, 1
orendlabel18:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel69
	beq $t0, 0, andfalselabel69
	li , $t0, 1
	j andendlabel69
andfalselabel69:
	li , $t0, 0
andendlabel69:
	beq $t0, 1, iftrue40
	j ifend40
iftrue40:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend40:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel70
	beq $t0, 0, andfalselabel70
	li , $t0, 1
	j andendlabel70
andfalselabel70:
	li , $t0, 0
andendlabel70:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel71
	beq $t0, 0, andfalselabel71
	li , $t0, 1
	j andendlabel71
andfalselabel71:
	li , $t0, 0
andendlabel71:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel72
	beq $t0, 0, andfalselabel72
	li , $t0, 1
	j andendlabel72
andfalselabel72:
	li , $t0, 0
andendlabel72:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel19
	beq $t0, 1, ortruelabel19
	li , $t0, 0
	j orendlabel19
ortruelabel19:
	li , $t0, 1
orendlabel19:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel73
	beq $t0, 0, andfalselabel73
	li , $t0, 1
	j andendlabel73
andfalselabel73:
	li , $t0, 0
andendlabel73:
	beq $t0, 1, iftrue41
	j ifend41
iftrue41:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend41:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel74
	beq $t0, 0, andfalselabel74
	li , $t0, 1
	j andendlabel74
andfalselabel74:
	li , $t0, 0
andendlabel74:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel75
	beq $t0, 0, andfalselabel75
	li , $t0, 1
	j andendlabel75
andfalselabel75:
	li , $t0, 0
andendlabel75:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel76
	beq $t0, 0, andfalselabel76
	li , $t0, 1
	j andendlabel76
andfalselabel76:
	li , $t0, 0
andendlabel76:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 1, ortruelabel20
	beq $t0, 1, ortruelabel20
	li , $t0, 0
	j orendlabel20
ortruelabel20:
	li , $t0, 1
orendlabel20:
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel77
	beq $t0, 0, andfalselabel77
	li , $t0, 1
	j andendlabel77
andfalselabel77:
	li , $t0, 0
andendlabel77:
	beq $t0, 1, iftrue42
	j ifend42
iftrue42:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend42:
	lw $v0, 0($fp)
	j half_open32
half_open32:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
open31:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue43
	j ifend43
iftrue43:
	li $v0, 0
	j open32
ifend43:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel78
	beq $t0, 0, andfalselabel78
	li , $t0, 1
	j andendlabel78
andfalselabel78:
	li , $t0, 0
andendlabel78:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel79
	beq $t0, 0, andfalselabel79
	li , $t0, 1
	j andendlabel79
andfalselabel79:
	li , $t0, 0
andendlabel79:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel80
	beq $t0, 0, andfalselabel80
	li , $t0, 1
	j andendlabel80
andfalselabel80:
	li , $t0, 0
andendlabel80:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel81
	beq $t0, 0, andfalselabel81
	li , $t0, 1
	j andendlabel81
andfalselabel81:
	li , $t0, 0
andendlabel81:
	beq $t0, 1, iftrue44
	j ifend44
iftrue44:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend44:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel82
	beq $t0, 0, andfalselabel82
	li , $t0, 1
	j andendlabel82
andfalselabel82:
	li , $t0, 0
andendlabel82:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel83
	beq $t0, 0, andfalselabel83
	li , $t0, 1
	j andendlabel83
andfalselabel83:
	li , $t0, 0
andendlabel83:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel84
	beq $t0, 0, andfalselabel84
	li , $t0, 1
	j andendlabel84
andfalselabel84:
	li , $t0, 0
andendlabel84:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel85
	beq $t0, 0, andfalselabel85
	li , $t0, 1
	j andendlabel85
andfalselabel85:
	li , $t0, 0
andendlabel85:
	beq $t0, 1, iftrue45
	j ifend45
iftrue45:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend45:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel86
	beq $t0, 0, andfalselabel86
	li , $t0, 1
	j andendlabel86
andfalselabel86:
	li , $t0, 0
andendlabel86:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel87
	beq $t0, 0, andfalselabel87
	li , $t0, 1
	j andendlabel87
andfalselabel87:
	li , $t0, 0
andendlabel87:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel88
	beq $t0, 0, andfalselabel88
	li , $t0, 1
	j andendlabel88
andfalselabel88:
	li , $t0, 0
andendlabel88:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel89
	beq $t0, 0, andfalselabel89
	li , $t0, 1
	j andendlabel89
andfalselabel89:
	li , $t0, 0
andendlabel89:
	beq $t0, 1, iftrue46
	j ifend46
iftrue46:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend46:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel90
	beq $t0, 0, andfalselabel90
	li , $t0, 1
	j andendlabel90
andfalselabel90:
	li , $t0, 0
andendlabel90:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel91
	beq $t0, 0, andfalselabel91
	li , $t0, 1
	j andendlabel91
andfalselabel91:
	li , $t0, 0
andendlabel91:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel92
	beq $t0, 0, andfalselabel92
	li , $t0, 1
	j andendlabel92
andfalselabel92:
	li , $t0, 0
andendlabel92:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel93
	beq $t0, 0, andfalselabel93
	li , $t0, 1
	j andendlabel93
andfalselabel93:
	li , $t0, 0
andendlabel93:
	beq $t0, 1, iftrue47
	j ifend47
iftrue47:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend47:
	lw $v0, 0($fp)
	j open32
open32:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
four1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
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
	lw $t0, 12($fp)
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue48
	j ifend48
iftrue48:
	li $v0, 0
	j four2
ifend48:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel94
	beq $t0, 0, andfalselabel94
	li , $t0, 1
	j andendlabel94
andfalselabel94:
	li , $t0, 0
andendlabel94:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel95
	beq $t0, 0, andfalselabel95
	li , $t0, 1
	j andendlabel95
andfalselabel95:
	li , $t0, 0
andendlabel95:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel96
	beq $t0, 0, andfalselabel96
	li , $t0, 1
	j andendlabel96
andfalselabel96:
	li , $t0, 0
andendlabel96:
	beq $t0, 1, iftrue49
	j ifend49
iftrue49:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend49:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel97
	beq $t0, 0, andfalselabel97
	li , $t0, 1
	j andendlabel97
andfalselabel97:
	li , $t0, 0
andendlabel97:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel98
	beq $t0, 0, andfalselabel98
	li , $t0, 1
	j andendlabel98
andfalselabel98:
	li , $t0, 0
andendlabel98:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel99
	beq $t0, 0, andfalselabel99
	li , $t0, 1
	j andendlabel99
andfalselabel99:
	li , $t0, 0
andendlabel99:
	beq $t0, 1, iftrue50
	j ifend50
iftrue50:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend50:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 1
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel100
	beq $t0, 0, andfalselabel100
	li , $t0, 1
	j andendlabel100
andfalselabel100:
	li , $t0, 0
andendlabel100:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel101
	beq $t0, 0, andfalselabel101
	li , $t0, 1
	j andendlabel101
andfalselabel101:
	li , $t0, 0
andendlabel101:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	addi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel102
	beq $t0, 0, andfalselabel102
	li , $t0, 1
	j andendlabel102
andfalselabel102:
	li , $t0, 0
andendlabel102:
	beq $t0, 1, iftrue51
	j ifend51
iftrue51:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend51:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 2
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 2
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel103
	beq $t0, 0, andfalselabel103
	li , $t0, 1
	j andendlabel103
andfalselabel103:
	li , $t0, 0
andendlabel103:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 3
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 3
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel104
	beq $t0, 0, andfalselabel104
	li , $t0, 1
	j andendlabel104
andfalselabel104:
	li , $t0, 0
andendlabel104:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	addi $t0, $t0, 4
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	subi $t0, $t0, 4
	sw $t0, 12($sp)
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 16($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel105
	beq $t0, 0, andfalselabel105
	li , $t0, 1
	j andendlabel105
andfalselabel105:
	li , $t0, 0
andendlabel105:
	beq $t0, 1, iftrue52
	j ifend52
iftrue52:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend52:
	lw $v0, 0($fp)
	j four2
four2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
GetComputerMove1:
	sw $fp, -16($sp)
	sw $sp, -20($sp)
	sw $ra, -24($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -28
	li , $t0, 0
	sw $t0, -8($fp)
	j fortest12
forstart12:
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest12:
	addi $sp, $sp, -8
	lw $t0, -8($fp)
	sw $t0, 4($sp)
	lw $t0, 4($fp)
	sw $t0, 8($sp)
	jal legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, ntruelabel3
	li, $t0, 1
	j nendlabel3
ntruelabel3:
	li , $t0, 0
nendlabel3:
	beq $t0, 1, forstart12
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	li , $t0, 2
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	lw $t0, -8($fp)
	sw $t0, -4($fp)
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	jal UndoMove1
	addi $sp, $sp, 8
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
	j fortest13
forstart13:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	li , $t0, 2
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, iftrue53
	j ifend53
iftrue53:
	lw $t0, -12($fp)
	sw $t0, 0($fp)
	lw $t0, -8($fp)
	sw $t0, -4($fp)
ifend53:
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	jal UndoMove1
	addi $sp, $sp, 8
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest13:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart13
	lw $v0, -4($fp)
	j GetComputerMove2
GetComputerMove2:
	lw $ra, -24($fp)
	lw $sp, -20($fp)
	lw $fp, -16($fp)
	jr $ra
min1:
	sw $fp, -16($sp)
	sw $sp, -20($sp)
	sw $ra, -24($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -28
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue54
	j ifend54
iftrue54:
	lw $t0, 12($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 12($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	subi $t0, $t0, 1
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	li $v0, 0
	j min2
ifend54:
	li , $t0, 0
	sw $t0, -8($fp)
	j fortest14
forstart14:
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest14:
	addi $sp, $sp, -8
	lw $t0, -8($fp)
	sw $t0, 4($sp)
	lw $t0, 4($fp)
	sw $t0, 8($sp)
	jal legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, ntruelabel4
	li, $t0, 1
	j nendlabel4
ntruelabel4:
	li , $t0, 0
nendlabel4:
	beq $t0, 1, forstart14
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	li , $t0, 2
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	lw $t0, -8($fp)
	sw $t0, -4($fp)
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal max1
	addi $sp, $sp, 12
	lw $t0, 12($fp)
	lw $t0, -4($t0)
	sw $t0, 0($fp)
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	jal UndoMove1
	addi $sp, $sp, 8
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
	j fortest15
forstart15:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	li , $t0, 2
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal max1
	addi $sp, $sp, 12
	lw $t0, 12($fp)
	lw $t0, -4($t0)
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, iftrue55
	j ifend55
iftrue55:
	lw $t0, -12($fp)
	sw $t0, 0($fp)
	lw $t0, -8($fp)
	sw $t0, -4($fp)
ifend55:
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	jal UndoMove1
	addi $sp, $sp, 8
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest15:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart15
	lw $t0, 12($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 12($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
min2:
	lw $ra, -24($fp)
	lw $sp, -20($fp)
	lw $fp, -16($fp)
	jr $ra
max1:
	sw $fp, -16($sp)
	sw $sp, -20($sp)
	sw $ra, -24($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -28
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue56
	j ifend56
iftrue56:
	lw $t0, 12($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 12($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	subi $t0, $t0, 1
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	li $v0, 0
	j max2
ifend56:
	li , $t0, 0
	sw $t0, -8($fp)
	j fortest16
forstart16:
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest16:
	addi $sp, $sp, -8
	lw $t0, -8($fp)
	sw $t0, 4($sp)
	lw $t0, 4($fp)
	sw $t0, 8($sp)
	jal legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, ntruelabel5
	li, $t0, 1
	j nendlabel5
ntruelabel5:
	li , $t0, 0
nendlabel5:
	beq $t0, 1, forstart16
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	li , $t0, 1
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	lw $t0, -8($fp)
	sw $t0, -4($fp)
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal min1
	addi $sp, $sp, 12
	lw $t0, 12($fp)
	lw $t0, -4($t0)
	sw $t0, 0($fp)
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	jal UndoMove1
	addi $sp, $sp, 8
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
	j fortest17
forstart17:
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	li , $t0, 1
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	subi $t0, $t0, 1
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal min1
	addi $sp, $sp, 12
	lw $t0, 12($fp)
	lw $t0, -4($t0)
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	beq $t0, 1, iftrue57
	j ifend57
iftrue57:
	lw $t0, -12($fp)
	sw $t0, 0($fp)
	lw $t0, -8($fp)
	sw $t0, -4($fp)
ifend57:
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -8($fp)
	sw $t0, 8($sp)
	jal UndoMove1
	addi $sp, $sp, 8
	lw $t0, -8($fp)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest17:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart17
	lw $t0, 12($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 12($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
max2:
	lw $ra, -24($fp)
	lw $sp, -20($fp)
	lw $fp, -16($fp)
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
