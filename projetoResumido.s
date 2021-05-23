@@@@@@@@@@@@@@@@@@@@@@@@@@@@ projeto de OAC v7.6 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@ Demonstração: elementos do array armazenados nos registradores R2 até R9 @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     

.global  _start @@@@ A label _start é global, pode ser acessada por todas as outras

.text @@@@ Aqui é onde ficam os códigos em si

_start:                 @label global _start
      LDR R0,=Iarray          @ R0 é o array de entrada
      LDR R2,=Oarray          @ R2 é o array de saída
      LDR R4,=factor          @ Armazene endereço de factor em R4
      LDR R1, [R4]            @ R1 recebe o valor de do endereço em R4(factor, que é 3)
      LDR R4,=lenght          @ Armazene lenght em R4  
      LDR R3, [R4]            @ R3 recebe o valor de R4(lenght, que é 5)      
      MOV R4, #0              @ R4 será onde guardaremos os resultados da MUL 

      @ R0 é o array de entrada
      @ R1 é o 3
      @ R2 é o array de saída
      @ R3 é o tamanho do array
      @ R4 é a variável de uso geral

check:                        @label check
      CMP R3,#0               @ compare R3 com 0               
      BNE loop                @ Pule para a label loop caso a comparação dê falso (Z=0)
      B _exit                 @ Caso a comparação dê verdadeiro, pule para a label _exit

loop:                   @label loop
      LDR R5,[R0],#4          @ carregue o valor de R0, guarde em R5 depois some R0 com 4             
      MUL R4, R5, R1          @ Multiplique o valor de R5 pelo valor de R1 e guarde em R4
      STR R4,[R2],#4          @ guarde o valor de R4 no endereço de R2, depois some R2 com 4    
      SUB R3, R3, #1          @ diminua 1 de R3 e guarde o resultado em R3    
      B check                 @ Pule para a checkagem

_exit:                  @label _exit
      LDR R1,=Oarray

      @ essa parte é de fim demonstrativos

      LDR R1, [R0,#0]         @array[0]
      LDR R2, [R0,#4]         @array[1]
      LDR R3, [R0,#8]         @array[2]
      LDR R4, [R0,#12]        @array[3]
      LDR R5, [R0,#16]        @array[4]
      LDR R6, [R0,#20]        @array[5]

      @

      SWI 0x11                @Termine o programa

.data                         @Aqui é onde ficam os dados do programa

factor: .word 3               @Constante a ser multiplicada (no nosso caso 3)

@Tamanho dos arrays
lenght: .word 6             

@Array de entrada                   
Iarray: .word 1,1,1,1,1,1      

@Array de saída
Oarray: .word 0
