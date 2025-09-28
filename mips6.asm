.data
     n1:.asciiz "\nDigite um número:"
     numero_invalido:.asciiz "\nNúmero inválido"
     centena:.asciiz "\nCentena:"
     dezena:.asciiz "\nDezena:"
     unidade:.asciiz "\nUnidade:"
    
.text
main:
    # Solicita n1
    li $v0, 4
    la $a0, n1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0   

    # se n1 > 999 
    bgt $t0,999,invalido
    # se 100 > n1
    blt $t0,100,invalido
        
    #calculando centena,dezena e unidade 
    
    #centena
    li $t1,100
    div $t0,$t1
    mflo $t2         # Centena $t2
    
   # Resto da divisão por 100
    mfhi $t3
    
   # Dezena 
   li $t1,10
   move $t4,$t3
    div $t4,$t1
    mflo $t5        # Dezena $t5
    # Resto da divisão por 10 
    mfhi $t6       # Unidade $t6
    
    
    # Imprimir centena
    li $v0, 4
    la $a0, centena
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 11
    li $a0, 10      
    syscall

    # Imprimir dezena
    li $v0, 4
    la $a0,dezena
    syscall
    li $v0, 1
    move $a0, $t5
    syscall
    li $v0, 11
    li $a0, 10    
    syscall

    # Imprimir unidade
    li $v0, 4
    la $a0,unidade
    syscall
    li $v0, 1
    move $a0, $t6
    syscall
    li $v0, 11
    li $a0, 10     
    syscall
    j fimse
    
 invalido:
    li $v0, 4
    la $a0, numero_invalido
    syscall
    j fimse
    
 fimse:     
    
      
          