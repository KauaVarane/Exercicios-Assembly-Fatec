.data
     n1:.asciiz "\nDigite um número:"
     n2:.asciiz "\nDigite outro número:"
     iguais:.asciiz "\nOs número são iguais:"
     maior:.asciiz "\nMaior:"
     menor:.asciiz "\nMenor:"
    
.text
main:
    # Solicita n1
    li $v0, 4
    la $a0, n1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0   

    # Solicita n2
    li $v0, 4
    la $a0, n2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0   

    # se n1 == n2
    beq $t1,$t0,n1_n2_igual
    # se n1 > n2 
    bgt $t0,$t1,n1_maior
    # se n2 > n1

    li $v0, 4
    la $a0, maior
    syscall

    li $v0, 1
    move $a0, $t1
    syscall
    
     li $v0, 4
    la $a0, menor
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
    j fimse 
n1_n2_igual:
    li $v0, 4
    la $a0, iguais
    syscall
    j fimse
    
   
n1_maior:

    li $v0, 4
    la $a0, maior
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
    
     li $v0, 4
    la $a0, menor
    syscall

    li $v0, 1
    move $a0, $t1
    syscall
    j fimse 

 fimse:     
    
      
          