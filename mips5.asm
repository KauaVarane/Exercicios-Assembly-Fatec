.data
    msg: .asciiz "\nDigite um número positivo: "
    msg_maior: .asciiz "\nMaior valor: "
    msg_menor: .asciiz "\nMenor valor: "

.text
main:
    li $t0, 0          
    li $t1, 0          

loop:
    beq $t0, 10, fim   

    # Solicita número
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5         
    syscall
    move $t2, $v0      

    blt $t2, 0, loop   

    # Se for o primeiro número positivo
    beq $t1, 0, primeiro_valido

    # Verifica maior
    bgt $t2, $t3, atualiza_maior

verifica_menor:
    blt $t2, $t4, atualiza_menor
    j conta

atualiza_maior:
    move $t3, $t2      
    j verifica_menor

atualiza_menor:
    move $t4, $t2      
    j conta

primeiro_valido:
    move $t3, $t2   
    move $t4, $t2  
    li $t1, 1        

conta:
    addi $t0, $t0, 1  
    j loop

fim:
    # Exibe maior
    li $v0, 4
    la $a0, msg_maior
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    # Exibe menor
    li $v0, 4
    la $a0, msg_menor
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    # Finaliza
    li $v0, 10
    syscall
