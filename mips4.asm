.data
    msg1: .asciiz "\nDigite o primeiro número: "
    msg2: .asciiz "\nDigite o segundo número: "
    resultado: .asciiz "\nSoma dos ímpares entre eles: "

.text
main:
    # Lê primeiro número
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0    

    # Lê segundo número
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Descobre maior e menor
    bgt $t0, $t1, troca
    move $t2, $t0     
    move $t3, $t1    
    j inicio_loop

troca:
    move $t2, $t1     
    move $t3, $t0   

inicio_loop:
    addi $t2, $t2, 1     
    li $t4, 0             

loop:
    bge $t2, $t3, fim     

    # Verifica se é ímpar
    andi $t5, $t2, 1
    beq $t5, 0, nao_impar

    # Se for ímpar, soma
    add $t4, $t4, $t2

nao_impar:
    addi $t2, $t2, 1
    j loop

fim:
    # Imprime resultado
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
