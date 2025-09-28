.data
msg1: .asciiz "Digite o primeiro ano: "
msg2: .asciiz "Digite o segundo ano: "
msg3: .asciiz "A diferenca entre os anos nao pode ser maior que 1000.\n"
msg4: .asciiz "Quantidade de anos bissextos: "
newline: .asciiz "\n"

.text
.globl main

main:
# Entrada dos dois anos
entrada_anos:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      # $t0 = ano1

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0      # $t1 = ano2

    # Calcula diferenca absoluta: diff = abs(ano2 - ano1)
    sub $t2, $t1, $t0   # $t2 = ano2 - ano1
    bltz $t2, troca     # se negativo, troca os anos
    j verifica_dif

troca:
    sub $t2, $t0, $t1   # $t2 = ano1 - ano2
    move $t3, $t0       # swap t0 e t1
    move $t0, $t1
    move $t1, $t3

verifica_dif:
    li $t4, 1000
    bgt $t2, $t4, erro_ano

    j conta_bissextos

erro_ano:
    li $v0, 4
    la $a0, msg3
    syscall
    j entrada_anos

conta_bissextos:
    move $t5, $t0      # contador do loop = ano atual
    li $t6, 0          # contador de bissextos

loop:
    bgt $t5, $t1, fim_loop

    # Verifica se o ano é bissexto
    move $t7, $t5

    # Se não for divisível por 4, não é bissexto
    li $t8, 4
    rem $t9, $t7, $t8
    bne $t9, $zero, proximo

    # Se for divisível por 100
    li $t8, 100
    rem $t9, $t7, $t8
    bne $t9, $zero, eh_bissexto   # se NÃO for por 100 ? é bissexto

    # Se for divisível por 400
    li $t8, 400
    rem $t9, $t7, $t8
    beq $t9, $zero, eh_bissexto   # se for por 400 ? é bissexto

    # Se for divisível por 100 mas não por 400 ? NÃO é bissexto
    j proximo

eh_bissexto:
    addi $t6, $t6, 1

proximo:
    addi $t5, $t5, 1
    j loop

fim_loop:
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
