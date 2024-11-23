
.data
array: .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24  
                         

.text
.globl main

main:
   
    li $s1, 10            # $s1 = length (10 elements)
    li $s2, 0             # $s2 = count (initialize to 0)

    
    li $s0, 0             # $s0 = i

loop:

    bge $s0, $s1, exit # Exit the loop when all is done
    
    la $t0, array         # Load base address in $t0
    sll $t1, $s0, 2       # Multiply i by 4 
    add $t2, $t0, $t1     # Compute address of array[i]

    
    lw $t3, 0($t2)        # $t3 = array[i]

    
    andi $t4, $t3, 3    #checks last two bits
    bne $t4, $zero, increment_i # If last two bits are not 0, skip count++

    
    addi $s2, $s2, 1      # count++

increment_i:
   
    addi $s0, $s0, 1      # i++

    
    j loop

exit:
   
    li $v0, 1              
    move $a0, $s2         # Move count to $a0
    syscall               # Print 


    
    li $v0, 10            # exit
    syscall
