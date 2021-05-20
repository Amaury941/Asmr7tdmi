@@@@@@@@@@@@@@@@@@@@@@@@@@@@ projeto de OAC v7.6 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@ Demonstração: elementos do array armazenados nos registradores R2 até R9 @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     

.global  _start @A label _start é global, pode ser acessada por todas as outras

.data @aqui é onde ficam os dados do programa

@Tamanho dos arrays
lenght: .word 8                           

@Constante a ser multiplicada (no nosso caso 3)
factor: .word 3

@Array de entrada                   
INarray: .word 1,2,3,4,5,6,7,8     

@Array de saída
OUTarray: .word 0,0,0,0,0,0,0,0     

.text               @aqui é onde ficam os códigos em si

_start:                 @label global _start
      LDR R0,=INarray         @ R0 é o array de entrada
      LDR R2,=OUTarray        @ R2 é o array de saída
      LDR R4,=factor          @ armazene factor em R4
      LDR R1, [R4]            @ R1 recebe o valor de R4(factor, que é 3)
      LDR R4,=lenght          @ armazene lenght em R4  
      LDR R3, [R4]            @ R3 recebe o valor de R4(lenght, que é 5)      
      MOV R4, #0              @ R4 será onde guardaremos os resultados da MUL 

check:                        @label check
      CMP R3,#0               @ compare R3 com 0               
      BNE loop                @ pule para a label loop caso a comparação dê falso (Z=0)
      B _exit                 @ caso a comparação dê verdadeiro, pule para a label _exit

loop:                   @label loop
      LDR R5,[R0],#4          @ carregue o valor de R0, guarde em R5 depois some R0 com 4             
      MUL R4, R5, R1          @ multiplique o valor de R5 pelo valor de R1 e guarde em R4
      STR R4,[R2],#4          @ guarde o valor de R4 no endereço de R2, depois some R2 com 4    
      SUB R3, R3, #1          @ diminua 1 de R3 e guarde o resultado em R3    
      B check                 @ pule para a checkagem

_exit:                        @label _exit
      LDR R1,=OUTarray

      @ essa parte é de fim demonstrativos
      LDR R2, [R1,#0]      @array[0]
      LDR R3, [R1,#4]      @array[1]
      LDR R4, [R1,#8]      @array[2]
      LDR R5, [R1,#12]     @array[3]
      LDR R6, [R1,#16]     @array[4]
      LDR R7, [R1,#20]     @array[5]
      LDR R8, [R1,#24]     @array[6]
      LDR R9, [R1,#28]     @array[7]
      @

      SWI 0                @termine o programa
