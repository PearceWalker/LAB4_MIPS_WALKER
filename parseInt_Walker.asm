
.text
.globl main


main:
    la $a0, test_string1    # Load string address into $a0
    jal parseInt            # Call function
    

    
    li $v0, 1              
    move $a0, $v0          
    syscall              #Print

    
    li $v0, 10              #exit
    syscall


parseInt:
    li $v0, 0               
    li $t0, 10             

loop:
    lb $t1, 0($a0)          # Load the current character 
    beq $t1, $zero, exit  # If null terminator, exit

   
    li $t2,              # 0
    li $t3,              # 9
    blt $t1, $t2, error # If char < 0, it's invalid
    bgt $t1, $t3, error # If char > 9, it's invalid

    
    sub $t1, $t1, $t2       # $t1 = ASCII value - 0

    mul $v0, $v0, $t0       # $v0 = $v0 * 10
    add $v0, $v0, $t1       # $v0 = $v0 + digit

   
    addi $a0, $a0, 1        # Increment  
    j parse_loop            # Loop

error:
    li $v0, -1              # Set result to -1 on error
    jr $ra                  # Return

exit:
    jr $ra                  # Return


