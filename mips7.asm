.data
    msg1: .asciiz "Digite um numero: "
    msg2: .asciiz "Resultado: "

.text
main:
    # número
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0    

    # SE X >= 0
    bgez $t0, se_positivo

    # SENAO (X < 0): triplo
    li $t1, 3
    mul $t2, $t0, $t1
    j fim

se_positivo:
    li $t1, 2
    mul $t2, $t0, $t1

fim:
    # Exibir resultado
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Fim
    li $v0, 10
    syscall
