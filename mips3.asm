.data
salario: .asciiz "Digite o seu salário: "
novo_salario: .asciiz "O novo salário será: "

.text
.globl main

main:
    # Ler salario
    li $v0, 4
    la $a0, salario
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 

    # calcular novo salario
    mul $t1,$t0,25 
    div $t2,$t1,100 
    add $t3,$t2,$t0

    # Exibir o resultado
    li $v0, 4
    la $a0, novo_salario
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Fim
    li $v0, 10
    syscall
