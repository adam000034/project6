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
	li , $t0, 0
	sw $t0, -8($fp)
	li , $t0, 1
	sw $t0, -12($fp)
	li , $t0, 0
	sw $t0, -20($fp)
	li , $t0, 0
	sw $t0, -24($fp)
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
	j whiletest1
whilestart1:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal PrintBoard1
	addi $sp, $sp, 4
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
	addi $sp, $sp, -12
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	lw $t0, -16($fp)
	sw $t0, 8($sp)
	lw $t0, -12($fp)
	sw $t0, 12($sp)
	jal DoMove1
	addi $sp, $sp, 12
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
	beq $t0, 1, iftrue1
	j ifend1
iftrue1:
	li , $t0, 1
	sw $t0, -8($fp)
	lw $t0, -12($fp)
	sw $t0, -24($fp)
ifend1:
	lw $t0, -20($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue2
	j ifend2
iftrue2:
	li , $t0, 1
	sw $t0, -8($fp)
	li , $t0, 0
	sw $t0, -24($fp)
ifend2:
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
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal PrintBoard1
	addi $sp, $sp, 4
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
	lw $ra, -36($fp)
	lw $sp, -32($fp)
	lw $fp, -28($fp)
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
	beq $t0, 1, iftrue3
	j ifend3
iftrue3:
	li $v0, 0
	j legal2
ifend3:
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
	beq $t0, 1, iftrue4
	j ifend4
iftrue4:
	li $v0, 0
	j legal2
ifend4:
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
	j fortest3
forstart3:
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest2
forstart2:
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
	j fortest5
forstart5:
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest4
forstart4:
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
fortest4:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
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
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest6
forstart6:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest6:
	lw $t0, 0($fp)
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
	beq $t0, 1, iftrue5
	li $v0, 1
	j swap2
	j ifend5
iftrue5:
	li $v0, 2
	j swap2
ifend5:
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
	j fortest7
forstart7:
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
	beq $t0, 1, iftrue6
	j ifend6
iftrue6:
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
ifend6:
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
win1:
	sw $fp, -16($sp)
	sw $sp, -20($sp)
	sw $ra, -24($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -28
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest8
forstart8:
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
	beq $t0, 1, forstart8
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
	beq $t0, 1, iftrue7
	j ifend7
iftrue7:
	li $v0, 0
	j win2
ifend7:
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
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel2
	beq $t0, 0, andfalselabel2
	li , $t0, 1
	j andendlabel2
andfalselabel2:
	li , $t0, 0
andendlabel2:
	beq $t0, 1, whilestart2
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue8
	j ifend8
iftrue8:
	li $v0, 1
	j win2
ifend8:
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel3
	beq $t0, 0, andfalselabel3
	li , $t0, 1
	j andendlabel3
andfalselabel3:
	li , $t0, 0
andendlabel3:
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel4
	beq $t0, 0, andfalselabel4
	li , $t0, 1
	j andendlabel4
andfalselabel4:
	li , $t0, 0
andendlabel4:
	beq $t0, 1, whilestart4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue9
	j ifend9
iftrue9:
	li $v0, 1
	j win2
ifend9:
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel5
	beq $t0, 0, andfalselabel5
	li , $t0, 1
	j andendlabel5
andfalselabel5:
	li , $t0, 0
andendlabel5:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel6
	beq $t0, 0, andfalselabel6
	li , $t0, 1
	j andendlabel6
andfalselabel6:
	li , $t0, 0
andendlabel6:
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel7
	beq $t0, 0, andfalselabel7
	li , $t0, 1
	j andendlabel7
andfalselabel7:
	li , $t0, 0
andendlabel7:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel8
	beq $t0, 0, andfalselabel8
	li , $t0, 1
	j andendlabel8
andfalselabel8:
	li , $t0, 0
andendlabel8:
	beq $t0, 1, whilestart6
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel9
	beq $t0, 0, andfalselabel9
	li , $t0, 1
	j andendlabel9
andfalselabel9:
	li , $t0, 0
andendlabel9:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel10
	beq $t0, 0, andfalselabel10
	li , $t0, 1
	j andendlabel10
andfalselabel10:
	li , $t0, 0
andendlabel10:
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
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel12
	beq $t0, 0, andfalselabel12
	li , $t0, 1
	j andendlabel12
andfalselabel12:
	li , $t0, 0
andendlabel12:
	beq $t0, 1, whilestart8
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
	beq $t0, 1, iftrue12
	j ifend12
iftrue12:
	li $v0, 0
	j GetBoard2
ifend12:
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
