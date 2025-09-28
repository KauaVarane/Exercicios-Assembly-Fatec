.data
    msg1:  .asciiz "\nHoras normais trabalhadas: "
    msg2: .asciiz "\nHoras extras trabalhadas: "
    msg3:   .asciiz "\nValor do desconto: "
    msg4:  .asciiz "\nSalario bruto:"
    msg5:    .asciiz "\nSalario liquido: R$"

.text
main:
    # horas normais
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0        

    # horas extras
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0       

    # desconto
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0       

    # Calcula salário bruto
    li $t3, 10
    mul $t3, $t3, $t0   

    li $t4, 15
    mul $t4, $t4, $t1    

    add $t5, $t3, $t4    

    # Calcula salário líquido
    sub $t6, $t5, $t2    

    # Exibe salário bruto
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Exibe salário líquido
    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    move $a0, $t6
    syscall


    li $v0, 10
    syscall
