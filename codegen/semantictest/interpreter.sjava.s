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
	li , $t0, 1000
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
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal LoadProgram1
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal PrintProgram1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal countLabels1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
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
	addi $sp, $sp, -8
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	lw $t0, -4($fp)
	sw $t0, 8($sp)
	jal setlabels1
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	lw $t0, -4($fp)
	sw $t0, 8($sp)
	jal ExecuteProgram1
	addi $sp, $sp, 8
main2:
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
	jr $ra
ExecuteProgram1:
	sw $fp, -8($sp)
	sw $sp, -12($sp)
	sw $ra, -16($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -20
	addi $sp, $sp, -4
	li , $t0, 9
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
	lw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	j whiletest1
whilestart1:
	lw $t0, 4($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue1
	j ifend1
iftrue1:
	li $v0, 0
	j ExecuteProgram2
ifend1:
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, -4($fp)
	sw $t0, 8($sp)
	lw $t0, 0($fp)
	sw $t0, 12($sp)
	lw $t0, 8($fp)
	sw $t0, 16($sp)
	jal ExecuteCommand1
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	sw $t0, -4($fp)
whiletest1:
	li , $t0, 1
	beq $t0, 1, whilestart1
ExecuteProgram2:
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
	jr $ra
countLabels1:
	sw $fp, -8($sp)
	sw $sp, -12($sp)
	sw $ra, -16($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -20
	li , $t0, 0
	sw $t0, 0($fp)
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest1
forstart1:
	lw $t0, 4($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue2
	j ifend2
iftrue2:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend2:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest1:
	lw $t0, 4($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	beq $t0, 1, forstart1
	lw $v0, 0($fp)
	j countLabels2
countLabels2:
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
	jr $ra
setlabels1:
	sw $fp, -12($sp)
	sw $sp, -16($sp)
	sw $ra, -20($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -24
	li , $t0, 0
	sw $t0, 0($fp)
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
	lw $t0, -4($fp)
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
	beq $t0, 1, iftrue3
	j ifend3
iftrue3:
	li $v0, 0
	j setlabels2
ifend3:
	lw $t0, 4($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue4
	j ifend4
iftrue4:
	addi $sp, $sp, -4
	li , $t0, 8
	sw $t0, 4($sp)
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	subi $t0, $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, -8($fp)
	subi $t0, $t0, 0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
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
	subi $t0, $t0, 10000
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend4:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest2:
	li , $t0, 1
	beq $t0, 1, forstart2
setlabels2:
	lw $ra, -20($fp)
	lw $sp, -16($fp)
	lw $fp, -12($fp)
	jr $ra
ExecuteCommand1:
	sw $fp, -28($sp)
	sw $sp, -32($sp)
	sw $ra, -36($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -40
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
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue26
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 2
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue25
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 3
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue24
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue23
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 5
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue22
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 6
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue21
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 7
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue20
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 8
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue19
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue18
	j ifend18
iftrue18:
	lw $t0, 0($fp)
	subi $t0, $t0, 90000
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	sw $t0, -24($fp)
	lw $t0, -24($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -24($fp)
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -24($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, -16($fp)
	lw $t0, -24($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -24($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel1
	beq $t0, 0, andfalselabel1
	li , $t0, 1
	j andendlabel1
andfalselabel1:
	li , $t0, 0
andendlabel1:
	beq $t0, 1, iftrue17
	j ifend17
iftrue17:
	lw $t0, 12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -24($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -16($fp)
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend17:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend18:
	j ifend19
iftrue19:
	lw $t0, 0($fp)
	subi $t0, $t0, 80000
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	sw $t0, -4($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, -16($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel2
	beq $t0, 0, andfalselabel2
	li , $t0, 1
	j andendlabel2
andfalselabel2:
	li , $t0, 0
andendlabel2:
	beq $t0, 1, iftrue16
	j ifend16
iftrue16:
	lw $t0, 4($fp)
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
	lw $t0, 12($fp)
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
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend16:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend19:
	j ifend20
iftrue20:
	lw $t0, 0($fp)
	subi $t0, $t0, 70000
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	sw $t0, -4($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, -16($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, -16($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel3
	beq $t0, 0, andfalselabel3
	li , $t0, 1
	j andendlabel3
andfalselabel3:
	li , $t0, 0
andendlabel3:
	beq $t0, 1, iftrue15
	j ifend15
iftrue15:
	lw $t0, 12($fp)
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
	lw $t0, 4($fp)
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
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend15:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend20:
	j ifend21
iftrue21:
	lw $t0, 0($fp)
	subi $t0, $t0, 60000
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -8($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -12($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
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
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
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
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
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
	lw $t0, -12($fp)
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
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel8
	beq $t0, 0, andfalselabel8
	li , $t0, 1
	j andendlabel8
andfalselabel8:
	li , $t0, 0
andendlabel8:
	beq $t0, 1, iftrue14
	j ifend14
iftrue14:
	lw $t0, 12($fp)
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
	lw $t0, 12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
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
	lw $t0, 12($fp)
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend14:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend21:
	j ifend22
iftrue22:
	lw $t0, 0($fp)
	subi $t0, $t0, 50000
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -8($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -12($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
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
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
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
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
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
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel12
	beq $t0, 0, andfalselabel12
	li , $t0, 1
	j andendlabel12
andfalselabel12:
	li , $t0, 0
andendlabel12:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel13
	beq $t0, 0, andfalselabel13
	li , $t0, 1
	j andendlabel13
andfalselabel13:
	li , $t0, 0
andendlabel13:
	beq $t0, 1, iftrue13
	j ifend13
iftrue13:
	lw $t0, 12($fp)
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
	lw $t0, 12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
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
	lw $t0, 12($fp)
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend13:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend22:
	j ifend23
iftrue23:
	lw $t0, 0($fp)
	subi $t0, $t0, 40000
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -8($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 10
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -12($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel14
	beq $t0, 0, andfalselabel14
	li , $t0, 1
	j andendlabel14
andfalselabel14:
	li , $t0, 0
andendlabel14:
	beq $t0, 1, iftrue12
	j ifend12
iftrue12:
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel15
	beq $t0, 0, andfalselabel15
	li , $t0, 1
	j andendlabel15
andfalselabel15:
	li , $t0, 0
andendlabel15:
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
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
	lw $t0, -12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel17
	beq $t0, 0, andfalselabel17
	li , $t0, 1
	j andendlabel17
andfalselabel17:
	li , $t0, 0
andendlabel17:
	beq $t0, 1, iftrue11
	j ifend11
iftrue11:
	lw $t0, 12($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -8($fp)
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
	lw $t0, 12($fp)
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
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, iftrue10
	lw $t0, 12($fp)
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
	j ifend10
iftrue10:
	lw $t0, 12($fp)
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
	li , $t0, 1
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend10:
ifend11:
ifend12:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend23:
	j ifend24
iftrue24:
	lw $t0, 0($fp)
	subi $t0, $t0, 30000
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel18
	beq $t0, 0, andfalselabel18
	li , $t0, 1
	j andendlabel18
andfalselabel18:
	li , $t0, 0
andendlabel18:
	beq $t0, 1, iftrue9
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($fp)
	j ifend9
iftrue9:
	lw $t0, 12($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue8
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	sw $t0, 8($fp)
	j ifend8
iftrue8:
	addi $sp, $sp, -8
	lw $t0, 16($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 8($sp)
	jal getLabelIndex1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	sw $t0, 8($fp)
ifend8:
ifend9:
	lw $v0, 8($fp)
	j ExecuteCommand2
ifend24:
	j ifend25
iftrue25:
	lw $t0, 0($fp)
	subi $t0, $t0, 20000
	sw $t0, 0($fp)
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1000
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 1
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue7
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sge $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel19
	beq $t0, 0, andfalselabel19
	li , $t0, 1
	j andendlabel19
andfalselabel19:
	li , $t0, 0
andendlabel19:
	beq $t0, 1, iftrue6
	j ifend6
iftrue6:
	addi $sp, $sp, -4
	lw $t0, 12($fp)
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
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
ifend6:
	j ifend7
iftrue7:
	lw $t0, 0($fp)
	subi $t0, $t0, 1000
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 100
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 9
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	beq $t2, 0, andfalselabel20
	beq $t0, 0, andfalselabel20
	li , $t0, 1
	j andendlabel20
andfalselabel20:
	li , $t0, 0
andendlabel20:
	beq $t0, 1, iftrue5
	addi $sp, $sp, -4
	li , $t0, 99
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, -4($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	j ifend5
iftrue5:
	lw $t0, 12($fp)
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
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
ifend5:
ifend7:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend25:
	j ifend26
iftrue26:
	lw $t0, 8($fp)
	addi $t0, $t0, 1
	addi $v0, $t0, 0
	j ExecuteCommand2
ifend26:
ExecuteCommand2:
	lw $ra, -36($fp)
	lw $sp, -32($fp)
	lw $fp, -28($fp)
	jr $ra
getLabelIndex1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest3
forstart3:
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
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue27
	j ifend27
iftrue27:
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
	lw $t0, -4($t0)
	addi $v0, $t0, 0
	j getLabelIndex2
ifend27:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest3:
	li , $t0, 1
	beq $t0, 1, forstart3
getLabelIndex2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
PrintProgram1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
dowhilestart1:
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
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
dowhiletest1:
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	beq $t0, 1, dowhilestart1
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
PrintProgram2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
LoadProgram1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 0
	sw $t0, 0($fp)
dowhilestart2:
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
dowhiletest2:
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
	li , $t0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sne $t0, $t2, $t0
	beq $t0, 1, dowhilestart2
LoadProgram2:
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
