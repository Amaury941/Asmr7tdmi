.global  _start

.text
      _start:

            LDR r0,=ProgramTittle
            SWI 0x02         @printa o valor armazenado em R0

            LDR R0,=length
            LDR R2, [R0]     @O tamanho do array
            LDR R7, [R0]     @O contador do print
            LDR R0,=factor
            LDR R3, [R0]     @O fator da multiplicação
            LDR R4,=Iarray   @O array de entrada
            LDR R5,=Oarray   @O array de saída
            LDR r0,=IarrayTittle @carrega o título do trabalho
            SWI 0x02             @printa o Título
            MOV R0, #1

      check:
            CMP R2,#0        @ cheque se R2 é igual a 0 e guarde no Z              
            BNE loop         @ pule para a label loop se Z == 0

            LDR r0,=Enx
            SWI 0x02         @printa o valor armazenado em R0
            LDR r0,=OarrayTittle @carrega o fim do array
            SWI 0x02             @printa o Título
            
            MOV R0, #1

            B Xcheck         @ se não pulou para a label loop, pule para _exit

      loop:
            LDR R1,[R4],#4          @ carregue o valor de R4, guarde em R0 depois some 4
            SWI 0x6b                @ printe os dados do registrador R1

            SWI 0x00                @ printe um espaço

            MUL R8, R1, R3          @ Multiplique o valor de R5 pelo valor de R1 e guarde em R4
            STR R8,[R5],#4          @ guarde o valor de R4 no endereço de R2, depois some R2 com 4
            SUB R2, R2, #1          @ diminua 1 de R3 e guarde o resultado em R3    
            B check                 @ Pule para a checkagem


      Xcheck:
            CMP R7,#0        @ cheque se R2 é igual a 0 e guarde no Z              
            BNE Xloop        @ pule para a label loop se Z == 0       
            B _exit          @ se não pulou para a label loop, pule para _exit

      Xloop:
            LDR R1,[R4],#4          @ carregue o valor de R4, guarde em R0 depois some 4
            SWI 0x6b                @ printe os dados do registrador R1
            
            SWI 0x00                @ printe um espaço

            SUB R7, R7, #1          @ diminua 1 de R7 e guarde o resultado em R7    
            B Xcheck                @ Pule para a checkagem


      _exit:
            LDR r0,=Enx @carrega o fim do array
            SWI 0x02             @printa o Título
            MOV R0, #1
            SWI 0x11                @Termine o programa

.data
      ProgramTittle: .asciz   "### Projeto de AOC ###\nGerando vetor tríplo\n"
      IarrayTittle:  .asciz   "### Vetor 1: [ "
      OarrayTittle:  .asciz   "### Vetor 2: [ "
      virgula: .asciz ", "
      Enx: .asciz "]\n"

      factor: .word 3               @Constante a ser multiplicada (no nosso caso 3)
                                              
      @Array de entrada
      Iarray: .word 1,2,3,4,5,6,7,8,9,10
      length: .word 10 @Tamanho do array

      @array de saída     
      Oarray: .word 0