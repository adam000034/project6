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
divides1:
	sw $fp, 0($sp)
	sw $sp, -4($sp)
	sw $ra, -8($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -12
	lw $t0, 4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	div $t0, $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 8($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	seq $t0, $t2, $t0
	beq $t0, 1, iftrue1
	li $v0, 0
	j divides2
	j ifend1
iftrue1:
	li $v0, 1
	j divides2
ifend1:
divides2:
	lw $ra, -8($fp)
	lw $sp, -4($fp)
	lw $fp, 0($fp)
	jr $ra
sqrt1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 1
	sw $t0, 0($fp)
	j fortest1
forstart1:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sgt $t0, $t2, $t0
	beq $t0, 1, iftrue2
	j ifend2
iftrue2:
	lw $t0, 0($fp)
	subi $t0, $t0, 1
	addi $v0, $t0, 0
	j sqrt2
ifend2:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest1:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart1
sqrt2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
prime1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 2
	sw $t0, 0($fp)
	j fortest2
forstart2:
	addi $sp, $sp, -8
	lw $t0, 4($fp)
	sw $t0, 4($sp)
	lw $t0, 0($fp)
	sw $t0, 8($sp)
	jal divides1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	beq $t0, 1, iftrue3
	j ifend3
iftrue3:
	li $v0, 0
	j prime2
ifend3:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest2:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	beq $t0, 1, forstart2
	li $v0, 1
	j prime2
prime2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
primes1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	li , $t0, 2
	sw $t0, 0($fp)
	j fortest3
forstart3:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal prime1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	beq $t0, 1, iftrue4
	j ifend4
iftrue4:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
ifend4:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest3:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sle $t0, $t2, $t0
	beq $t0, 1, forstart3
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
primes2:
	lw $ra, -12($fp)
	lw $sp, -8($fp)
	lw $fp, -4($fp)
	jr $ra
primes21:
	sw $fp, -12($sp)
	sw $sp, -16($sp)
	sw $ra, -20($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -24
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	addi $t0, $t0, 1
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
	li , $t0, 2
	sw $t0, 0($fp)
	j fortest4
forstart4:
	lw $t0, -8($fp)
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
	li , $t0, 1
	lw $t2, 4($t1)
	addi $t1,$t1, 4
	sw $t0, 0($t2)
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest4:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sle $t0, $t2, $t0
	beq $t0, 1, forstart4
	li , $t0, 2
	sw $t0, 0($fp)
	j fortest6
forstart6:
	lw $t0, -8($fp)
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
	beq $t0, 1, iftrue5
	j ifend5
iftrue5:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	li , $t0, 2
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, -4($fp)
	j fortest5
forstart5:
	lw $t0, -8($fp)
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
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 0($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -4($fp)
fortest5:
	lw $t0, -4($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sle $t0, $t2, $t0
	beq $t0, 1, forstart5
ifend5:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest6:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	addi $sp, $sp, -4
	lw $t0, 4($fp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	jal sqrt1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sle $t0, $t2, $t0
	beq $t0, 1, forstart6
	li , $t0, 2
	sw $t0, 0($fp)
	j fortest7
forstart7:
	lw $t0, -8($fp)
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
	beq $t0, 1, iftrue6
	j ifend6
iftrue6:
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal Print
	addi $sp, $sp, 4
ifend6:
	lw $t0, 0($fp)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest7:
	lw $t0, 0($fp)
	sw $t0, 0($t1)
	addi $t1,$t1, -4
	lw $t0, 4($fp)
	addi $t1,$t1, 4
	lw $t2, 0($t1)
	sle $t0, $t2, $t0
	beq $t0, 1, forstart7
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
primes22:
	lw $ra, -20($fp)
	lw $sp, -16($fp)
	lw $fp, -12($fp)
	jr $ra
main1:
	sw $fp, -4($sp)
	sw $sp, -8($sp)
	sw $ra, -12($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -16
	addi $sp, $sp, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal primes1
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	lw $t0, 0($fp)
	sw $t0, 4($sp)
	jal primes21
	addi $sp, $sp, 4
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
