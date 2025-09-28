.data
    msg_valor: .asciiz "Digite o valor da compra (1000 - 9999): "
    msg_parcela: .asciiz "Digite o valor da parcela (100 - 500): "
    msg_invalido: .asciiz "Valor invalido!\n"
    msg_total: .asciiz "Total de parcelas: "

.text
.globl main

main:
# Entrada do valor da compra 
le_valor:
    li $v0, 4
    la $a0, msg_valor
    syscall
    li $v0, 5
    syscall
    move $t0, $v0     # $t0 = valor da compra

    li $t1, 1000
    blt $t0, $t1, invalido

    li $t1, 9999
    bgt $t0, $t1, invalido

# Entrada do valor da parcela
le_parcela:
    li $v0, 4
    la $a0, msg_parcela
    syscall
    li $v0, 5
    syscall
    move $t1, $v0     # $t1 = valor da parcela

    li $t2, 100
    blt $t1, $t2, invalido

    li $t2, 500
    bgt $t1, $t2, invalido

# Cálculo do número de parcelas 
    div $t0, $t1
    mflo $t3       # $t3 = parcelas inteiras
    mfhi $t4       # $t4 = resto

    # Verifica se tem parcela menor no fim
    beqz $t4, imprime_parcelas     # se resto == 0, vai imprimir direto

    addi $t3, $t3, 1               # acrescenta 1 parcela se tiver resto

# Impressão 
imprime_parcelas:
    li $v0, 4
    la $a0, msg_total
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall

  #erro 
invalido:
    li $v0, 4
    la $a0, msg_invalido
    syscall
    li $v0, 10
    syscall
