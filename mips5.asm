.data
    msg1: .asciiz "Digite o valor de A: "
    msg2: .asciiz "Digite o valor de B: "
    msg3: .asciiz "O valor de C é: "

.text
main:
    #  A
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0    

    #  B
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0    

    #  se A == B
    beq $t0, $t1, soma

    # Senao C = A * B
    mul $t2, $t0, $t1
    j imprime

soma:
    add $t2, $t0, $t1  
imprime:
    # Exibir a mensagem
    li $v0, 4
    la $a0, msg3
    syscall

    # Exibir o valor de C
    li $v0, 1
    move $a0, $t2
    syscall

    # FIM
    li $v0, 10
    syscall
