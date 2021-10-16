.data 0x10000000

testValues: .word 3 
.asciiz      "add\n"
.globl main

.text
main:

lui $t0, 0x1000
lw $t2, ($t0)
or $s0, $0, $0

addi $t0, 4
lw $s3 ($t0)

or $s1, $0, $0


beq $s0 , $0 oddCheck
return:


			
			Loop:

				div $t2, $t2, 2
				mflo $t2
				add $s1, $s1, 1
				
				beq $t2 , $0 fin
				or $0, $0, $0
				
			
			j Loop
			or $0, $0, $0


	oddCheck:
	div $s2, $t2, 2
	mfhi $t1
	add $s0, $s0, 1
	or $0, $0, $0
	beq $t1, $0 return
	or $0, $0, $0
	
	add $s1, $s1, 1
	
	or $0, $0, $0
	j return
	


	plusOne:
	or $a0, $s3, $0 #out_string
	or $v0, $0, 4 # system call code for printing string = 4
	or $0, $0, $0
	syscall
		or $0, $0, $0
	j plusOneBack
	

	fin:
		or $a0, $s1, $0

		or $v0, $0, 1 #print an int 
		syscall
		or $0, $0, $0
		bne $s1, $0 plusOne
		plusOneBack:
		
		or $v0, $0, 10
		syscall
	
