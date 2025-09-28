.data
    msg1: .asciiz "Digite a altura (em cm) da pessoa: "
    msg2: .asciiz "A menor altura do grupo e: "
    msg3: .asciiz "A maior altura do grupo e: "
    msg4: .asciiz "Erro! A altura deve ser um valor positivo.\n"

.text
.globl main
main:
    # Inicializa as variáveis
    li $t0, 2147483647  
    li $t1, 0          

    li $t2, 0          
    li $t3, 15          

leitura:
    # Solicita a altura da pessoa
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t4, $v0   

    # Verifica se a altura é válida (positiva)
    blez $t4, erro_altura

    # Atualiza a menor altura
    blt $t4, $t1, atualiza_menor
    # Atualiza a maior altura
    bgt $t4, $t0, atualiza_maior

    j proxima_pessoa

atualiza_menor:
    move $t1, $t4   # Atualiza menor altura
    j proxima_pessoa

atualiza_maior:
    move $t0, $t4   # Atualiza maior altura

proxima_pessoa:
    # Incrementa o contador e verifica se são 15 pessoas
    addi $t2, $t2, 1
    bne $t2, $t3, leitura

    # Exibir a menor altura
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t1   # Exibir a menor altura
    syscall

    # Exibir a maior altura
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t0   # Exibir a maior altura
    syscall

    # Fim 
    li $v0, 10
    syscall

erro_altura:
    # Exibe mensagem de erro
    li $v0, 4
    la $a0, msg4
    syscall
    j leitura
