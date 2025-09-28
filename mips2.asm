.data
    n1: .asciiz "\nDigite o valor do Primeiro número:"
    n2: .asciiz "\nDigite o valor do Segundo número:"
   diferença: .asciiz "\nA diferença será:"
.text
main:
    # valor n1
    li $v0, 4
    la $a0, n1
    syscall
   	
    # leia n1
    li $v0, 5
    syscall
    add $t0, $v0, 0
    
    # valor n2
    li $v0, 4
    la $a0, n2
    syscall
   	
    # leia n2
    li $v0, 5
    syscall
    add $t1, $v0, 0
   	
  
    # se n1>n2 entao
     bgt $t0,$t1,n1_maior
    # se n1<n2 entao
     blt $t1,$t0,n2_maior
    # n1 maior
 n1_maior:
     sub $t2,$t1,$t0
     j resultado
     
    # n2 maior
 n2_maior:
     sub $t2,$t0,$t1
     j resultado
      
     
    # Mostra o resultado
resultado:    
    li $v0, 4
    la $a0, diferença
    syscall

    li $v0, 1              # imprimir inteiro
    move $a0, $t2
    syscall

    # Finaliza o programa
    li $v0, 10
    syscall  
