main:
    la $s1, Array
    lw $t0, 0($s1)
    lw $t1, 4($s1)
    slt $t2, $t0, $t1
    beqz $t2, swap
	
    
swap:
    la $a0, string
    li $v0, 4      	# specify Print String service
    syscall           	# print heading  
    
    lw $t0, 0($s1)
    li $v0, 1
    syscall
    addi $a0, $0, 0xA #ascii code for LF, if you have any trouble try 0xD for CR. ((http://stackoverflow.com/questions/9875468/printing-newline-in-mips))
    addi $v0, $0, 0xB #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
    syscall 
       
    lw $t1, 4($s1) 
    li $v0, 1
    syscall
    addi $a0, $0, 0xA #ascii code for LF, if you have any trouble try 0xD for CR. ((http://stackoverflow.com/questions/9875468/printing-newline-in-mips))
    addi $v0, $0, 0xB #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
    syscall