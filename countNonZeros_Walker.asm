
.data
array: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 0  
                                

.text
.globl main

main:
   
    li $s0, 0             

loop:
    
    la $t0, array          # Load array into $t0
    sll $t1, $s0, 2        # Multiply i by 4
    add $t2, $t0, $t1      # Compute address of array[i]

    
    lw $t3, 0($t2)         # $t3 = array[i]

    
    beq $t3, $zero, exit   # If array[i] == 0, exit the loop

    
    addi $s0, $s0, 1       # i++

    
    j loop

exit:
    
    li $v0, 1              
    move $a0, $s0          # Move i into $a0
    syscall                # Print 

   
    li $v0, 10             # Syscall code for exit
    syscall
