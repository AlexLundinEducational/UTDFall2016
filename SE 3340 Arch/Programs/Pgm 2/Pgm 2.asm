#####################################
# Pgm 2
#
# University of Texas at Dallas
# CS/CE 3340
# Fall 2016
#
# Alex Lundin
#
# Description of file content - small size program to accept two integer values from user, multiply them together and print the result
#
# main, read, printnewline, multiplyboth, endloop
#
######################################

######################################
# main 
#	- two calls on the read label to prompt user for two seperate integers.
#	- two calls on printnewline label after the read label
#	- one call on multboth which multiplies both values and the result will not handle overflow
#	- finally endloop
#
# Output
#	- recap of values entered, with newlines printed between entries and the total of the multplication without overflow.
#
# Variables
#	- $t0 and $t1 for input
#	- $t2 for result of multiplication
#
# read
#	- 5 syscall for user input
# Output
#	- none
# Variables
#	- none
#
# printnewline
#	- prints space between outputs of main
# Output
#	- none
# Variables
#	- none
#
#multiplyboth
#	- multiples the inputs and prints result
# Output
#	- result of multiplication
# Variables
#	- $t2 for result
#
# endloop - last label for the end of main
#
# Output - none
#
# Variables - none
#
######################################

      .data

      .text
main:
	jal read 		# jump and link to read label
	move $t0,$v0		# copy valued entered by user from $v0 to $t0
	
	li $v0, 1        	# system call code for print_int
	move $a0,$t0		# copy value in $t0 to $a0 for print function
        syscall          	# print it
        jal printnewline	# jump and link to printnewline label
        
	jal read		# jump and link to read label
	move $t1,$v0		# copy valued entered by user from $v0 to $t0
	
	li $v0, 1        	# system call code for print_int
	move $a0,$t1		# copy value in $t1 to $a0 for print function
        syscall          	# print value in $a0
	jal printnewline	# jump and link to printnewline label
	jal multiplyboth	# jump and link to multiplyboth label
	jal endloop		# jump and link to endloop label

read:
	li $v0,5		# load immediate value 5 into register $v0
	syscall			# syscall on $v0 for reading input from user
	jr $ra	  		# return to $ra
	
printnewline:
	addi $a0, $0, 0xA 	#ascii code for LF, if you have any trouble try 0xD for CR. ((http://stackoverflow.com/questions/9875468/printing-newline-in-mips))
        addi $v0, $0, 0xB 	#syscall 11 prints the lower 8 bits of $a0 as an ascii character.
        syscall
        jr $ra			# return to $ra

multiplyboth:
	mul $t2, $t1, $t0
	li $v0, 1        	# system call code for print_int
	move $a0,$t2		# copy value in $t0 to $a0 for print function
        syscall          	# print value in $a0        
        jr $ra	  		# return to $ra
endloop:
    	li $v0, 10            	# terminate program run and
    	syscall               	# Exit
