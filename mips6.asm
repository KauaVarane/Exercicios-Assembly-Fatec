.data
    n1: .asciiz "\nDigite um Ano: "
    n2: .asciiz "\nDigite um Ano MAIOR que o Primeiro: "
    msg1: .asciiz "\nA Diferen�a entre os Anos � mais de 1000.\n"
    msg2: .asciiz "\nQuantidade de anos bissextos: "
.text
main:
ler_txt:
    # Primeiro Ano
    li $v0, 4
    la $a0, n1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0    # $t0 = (N1)

    # Segundo Ano
    li $v0, 4
    la $a0, n2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0    # $t1 = (N2)

    # Calcula diferen�a (N2 - N1)
    sub $t2, $t1, $t0
    bltz $t2, corrige_valor  # Se diferen�a negativa, troca os valores
    j ver_diferenca

corrige_valor:
    sub $t2, $t0, $t1        # $t2 = N1 - N2
    move $t3, $t0
    move $t0, $t1
    move $t1, $t3

ver_diferenca:
    li $t4, 1000
    bgt $t2, $t4, erro_digite_novamente
    j bissextos

erro_digite_novamente:
    li $v0, 4
    la $a0, msg1
    syscall
    j ler_txt

bissextos:
    move $t5, $t0    # ano atual
    li $t6, 0        # contador de bissextos

loop:
    bgt $t5, $t1, fim_loop

    # $t7 = ano atual
    move $t7, $t5

    # verificar se divis�vel por 4
    li $t8, 4
    rem $t9, $t7, $t8
    bne $t9, $zero, proximo

    # verifica se divis�vel por 100
    li $t8, 100
    rem $t9, $t7, $t8
    bne $t9, $zero, ano_bissexto  # se N�O for por 100 - � bissexto

    # Verifica se divis�vel por 400
    li $t8, 400
    rem $t9, $t7, $t8
    beq $t9, $zero, ano_bissexto  # se for por 400 - � bissexto

    # Se chegou aqui: m�ltiplo de 100 mas n�o de 400 - n�o � bissexto
    j proximo

ano_bissexto:
    addi $t6, $t6, 1  # incrementa contador

proximo:
    addi $t5, $t5, 1
    j loop

fim_loop:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

