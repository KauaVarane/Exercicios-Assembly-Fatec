.data
msg1: .asciiz "Digite o salario atual: "
msg2: .asciiz "Novo salario com aumento de 25%: "

.text
.globl main

main:
    # Ler o salario atual
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # $t0 = salario atual

    # Calcular 25% do salario
    li $t1, 25
    mul $t2, $t0, $t1   # $t2 = salario * 25

    li $t3, 100
    div $t2, $t3        # divide (salario * 25) por 100
    mflo $t4            # $t4 = resultado da divisao (25% do salario)

    # Calcular novo salario
    add $t5, $t0, $t4   # $t5 = salario atual + aumento

    # Mostrar novo salario
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Finalizar programa
    li $v0, 10
    syscall
