.data
    msg1:.asciiz "Digite o primeiro numero : "
    msg2:.asciiz "Digite o segundo numero,diferente do primeiro: "
    msg3:.asciiz "Resultado da divisao: "

.text
main:
    # Lê A
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0     

# Loop B ? 0
le_b:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0   

    beq $t1, $zero, le_b   

# Divisão inteira: A / B
    div $t0, $t1
    mflo $t2          

# Exibir resultado
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

# Fim
    li $v0, 10
    syscall
