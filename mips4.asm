.data
    msg1: .asciiz "Digite um número entre 100 e 999: "
    msg_invalido: .asciiz "Número fora do intervalo!\n"
    msg_centena: .asciiz "CENTENA = "
    msg_dezena:  .asciiz "DEZENA = "
    msg_unidade: .asciiz "UNIDADE = "

.text
.globl main

main:
    # Solicita o número
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # $t0 = número digitado

    # Verifica se $t0 < 100
    li $t1, 100
    blt $t0, $t1, invalido

    # Verifica se $t0 > 999
    li $t1, 999
    bgt $t0, $t1, invalido

    # CENTENA = numero / 100
    li $t1, 100
    div $t0, $t1
    mflo $t2           # $t2 = centena

    # Resto da divisão por 100 (para pegar dezena e unidade)
    mfhi $t3           # $t3 = resto

    # DEZENA = resto / 10
    li $t1, 10
    div $t3, $t1
    mflo $t4           # $t4 = dezena
    mfhi $t5           # $t5 = unidade

    # Imprimir centena
    li $v0, 4
    la $a0, msg_centena
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 11
    li $a0, 10       # '\n'
    syscall

    # Imprimir dezena
    li $v0, 4
    la $a0, msg_dezena
    syscall
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 11
    li $a0, 10       # '\n'
    syscall

    # Imprimir unidade
    li $v0, 4
    la $a0, msg_unidade
    syscall
    li $v0, 1
    move $a0, $t5
    syscall
    li $v0, 11
    li $a0, 10       # '\n'
    syscall

    j fim

invalido:
    li $v0, 4
    la $a0, msg_invalido
    syscall

fim:
    li $v0, 10
    syscall
