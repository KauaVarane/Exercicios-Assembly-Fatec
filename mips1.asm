.data
    raio: .asciiz "\nDigite o valor do Raio:"
    comprimento: .asciiz "\nO Comprimento será: "
.text
main:
    # escreval("Digite o valor do raio: ")
    li $v0, 4
    la $a0, raio
    syscall
   	
    # leia(raio)
    li $v0, 5
    syscall
    add $t0, $v0, 0
   	
  
    # Calcula comprimento(C = 2 * ? * r)
    li $t1,2
    li $t2,3
    mul $t3,$t1,$t2
    mul $t4,$t3,$t0    

    # Mostra o resultado
    li $v0, 4
    la $a0, comprimento
    syscall

    li $v0, 1              # imprimir inteiro
    move $a0, $t4
    syscall

    # Finaliza o programa
    li $v0, 10
    syscall  
