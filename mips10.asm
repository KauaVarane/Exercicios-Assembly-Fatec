.data
    msg1: .asciiz "Digite um numero (negativo para parar): "
    msg2: .asciiz "Intervalo [0-25]: "
    msg3: .asciiz "Intervalo [26-50]: "
    msg4: .asciiz "Intervalo [51-75]: "
    msg5: .asciiz "Intervalo [76-100]: "
    msg6: .asciiz "Numeros negativos nao sao contados."

.text
main:
    # Inicializa os contadores para os intervalos
    li $t0, 0  
    li $t1, 0 
    li $t2, 0   
    li $t3, 0   

leitura:
    # Solicita o número
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t4, $v0   

    # Se o número for negativo, termina o programa
    blt $t4, $zero, fim

    # Verifica o intervalo e atualiza os contadores
    # [0-25]
    li $t5, 25
    blt $t4, $t5, intervalo1

    # [26-50]
    li $t5, 50
    blt $t4, $t5, intervalo2

    # [51-75]
    li $t5, 75
    blt $t4, $t5, intervalo3

    # [76-100]
    li $t5, 100
    blt $t4, $t5, intervalo4

    # Se o número for maior que 100, nada é feito
    j leitura

intervalo1:
    addi $t0, $t0, 1  # Incrementa o contador para o intervalo [0-25]
    j leitura

intervalo2:
    addi $t1, $t1, 1  # Incrementa o contador para o intervalo [26-50]
    j leitura

intervalo3:
    addi $t2, $t2, 1  # Incrementa o contador para o intervalo [51-75]
    j leitura

intervalo4:
    addi $t3, $t3, 1  # Incrementa o contador para o intervalo [76-100]
    j leitura

fim:
    # Exibe os resultados
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t0   # Exibe cont1 (para [0-25])
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t1   # Exibe cont2 (para [26-50])
    syscall

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t2   # Exibe cont3 (para [51-75])
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    move $a0, $t3   # Exibe cont4 (para [76-100])
    syscall

    # Fim
    li $v0, 10
    syscall
