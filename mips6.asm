.data
    msg1:.asciiz "Digite um numero: "
    msg2:.asciiz "Resultado: "

.text
main:
    # valor
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      

    # Verifica se é PAR ou ÍMPAR
    li $t1, 2
    rem $t2, $t0, $t1   

    # SE resto == 0 (par)
    beq $t2, $zero, se

    # SENAO (ímpar)
    addi $t3, $t0, 8    
    j fim

se:
    addi $t3, $t0, 5    

fim:
    # Exibir resultado
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Fim
    li $v0, 10
    syscall
