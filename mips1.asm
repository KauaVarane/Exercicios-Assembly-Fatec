.data
     #valores
     n1:.asciiz "\nDigite o Primeiro Valor:"
     n2:.asciiz "\nDigite o Segundo Valor:"
     n3:.asciiz "\nO primeiro valor agora é:"
     n4:.asciiz"\nO segundo Valor agora é:"
.text
main:
     # Digite o n1
       li $v0, 4
       la $a0, n1
       syscall 
     # leia o valor 
       li $v0, 5
       syscall
       add $t0, $v0, 0
       # Digite o n2
       li $v0, 4
       la $a0, n2
       syscall 
     # leia o valor 
       li $v0, 5
       syscall
       add $t1, $v0, 0
     # troca de valores
       move $t2,$t0
       move $t3,$t1
     # Exibir valores
       li $v0, 4
       la $a0, n3
       syscall 
       
        li $v0, 1
        move $a0, $t3
        syscall
        
        li $v0, 4
       la $a0, n4
       syscall 
       
        li $v0, 1
        move $a0, $t2
        syscall
      # fim
        li $v0, 10
        syscall      