.data
msg1: .asciiz "Digite o primeiro valor: "
msg2: .asciiz "Digite o segundo valor: "
msg3: .asciiz "Valor do primeiro registrador apos a troca: "
msg4: .asciiz "Valor do segundo registrador apos a troca: "

.text
.globl main

main:
    # Lê o primeiro valor
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   

    # Lê o segundo valor
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  

    # Troca os valores
    move $t2, $t0  
    move $t0, $t1  
    move $t1, $t2   

    # Mostra o novo valor do primeiro registrador
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Pula uma linha 
    li $v0, 11
    li $a0, 10    
    syscall

    # Mostra o novo valor 
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    # Fim
    li $v0, 10
    syscall
