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
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 0($fp)
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
	j fortest3
forstart3:
	li , $t0, 0
	sw $t0, -4($fp)
	j fortest1
forstart1:
	addi $sp, $sp, -4
	li , $t0, 0
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, -4($fp)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	j fortest2
forstart2:
	addi $sp, $sp, -4
	li , $t0, 0
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
	lw $t0, -4($fp)
	addi $t0, $t0, 1
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
	lw $t0, 0($fp)
	addi $t0, $t0, 1
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
	lw $ra, -16($fp)
	lw $sp, -12($fp)
	lw $fp, -8($fp)
	jr $ra
Abs1:
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
	sge $t0, $t2, $t0
	beq $t0, 1, iftrue1
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
	lw $v0, 4($fp)
	j Abs2
ifend1:
Abs2:
	lw $ra, -8($fp)
	lw $sp, -4($fp)
	lw $fp, 0($fp)
	jr $ra
Legal1:
	sw $fp, -12($sp)
	sw $sp, -16($sp)
	sw $ra, -20($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -24
	li , $t0, 1
	sw $t0, -8($fp)
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest5
forstart5:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
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
	li , $t0, 0
	sw $t0, -8($fp)
ifend2:
	lw $t0, -4($fp)
	addi $t0, $t0, 1
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
	lw $t0, 0($fp)
	addi $t0, $t0, 1
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
	lw $v0, -8($fp)
	j Legal2
Legal2:
	lw $ra, -20($fp)
	lw $sp, -16($fp)
	lw $fp, -12($fp)
	jr $ra
Solve1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 12($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	beq $t0, 1, iftrue4
	li , $t0, 0
	sw $t0, 0($fp)
	j fortest6
forstart6:
	lw $t0, 8($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 4
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	subi $t0, $t0, 1
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
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 8($fp)
	sw $t0, 8($sp)
	lw $t0, 12($fp)
	sw $t0, 12($sp)
	jal Solve1
	addi $sp, $sp, 12
ifend3:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
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
