sub $t0, $s0, $s1         # $t0 = i - j
add $t1, $s0, $s1         # $t1 = i + j

sll $t0, $t0, 2           # $t0 = (i - j) * 4 )
add $t0, $t0, $s2         # $t0 = address of A[i - j]

sll $t1, $t1, 2           # $t1 = (i + j) * 4
add $t1, $t1, $s2         # $t1 = address of A[i + j]


lw $t2, 0($t0)            # $t2 = A[i - j]
lw $t3, 0($t1)            # $t3 = A[i + j]

add $t4, $t2, $t3         # $t4 = A[i - j] + A[i + j]

addi $t5, $zero, 12       # $t5 =(offset for B[3])
add $t5, $t5, $s3         # $t5 = address of B[3]
sw $t4, 0($t5)            # result in B[3]

