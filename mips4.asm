.data
    msg1:  .asciiz "\nDigite a Base Maior: "
    msg2: .asciiz "\nDigite a Base Menor: "
    msg3:   .asciiz "\nDigite a Altura: "
    msg4:  .asciiz "\nArea Total:"
.text
main:
    # Base Maior
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0        

    # Base menor
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0       

    # Altura
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0       

    # Soma das bases
    add $t3, $t0, $t1      # $t3 = base_maior + base_menor

    # Multiplica pela altura
    mul $t4, $t3, $t2      # $t4 = (base_maior + base_menor) * altura

    # Divide por 2 
    li $t5, 2
    div $t4, $t5
    mflo $t6               # $t6 = área do trapézio

    # Exibe Area total
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t6
    syscall


    li $v0, 10
    syscall
