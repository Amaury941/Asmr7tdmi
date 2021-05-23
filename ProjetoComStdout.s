.data
      ProgramTittle: .asciz   "### Projeto de AOC ###\nGerando vetor tríplo\n"
      IarrayTittle:  .asciz   "### Vetor 1: [ "
      OarrayTittle:  .asciz   "### Vetor 2: [ "
      virgula: .asciz ", "
      Enx: .asciz "]\n"
      factor: .word 3                                              

      @Array de entrada
      Iarray: .word 1,2,3,4,5,6,7,8,9,10
      length: .word 10 @Tamanho do array

      @array de saída     
      Oarray: .word 0

.global  _start

.text
      _start:

            LDR r0,=ProgramTittle
            SWI 0x02
            LDR R0,=length
            LDR R2, [R0]
            LDR R7, [R0]
            LDR R0,=factor
            LDR R3, [R0]
            LDR R4,=Iarray
            LDR R5,=Oarray
            LDR R6,=Oarray
            LDR r0,=IarrayTittle
            SWI 0x02
            MOV R0, #1
      
      check:
            CMP R2,#0
            BNE loop

            LDR r0,=Enx
            SWI 0x02
            LDR r0,=OarrayTittle
            SWI 0x02            
            MOV R0, #1
            B Xcheck

      loop:
            LDR R1,[R4],#4
            SWI 0x6b 
            SWI 0x00
            MUL R8, R1, R3
            STR R8,[R5],#4
            SUB R2, R2, #1    
            B check

      Xcheck:
            CMP R7,#0              
            BNE Xloop    
            B _exit

      Xloop:
            LDR R1,[R6],#4
            SWI 0x6b
            SWI 0x00
            SUB R7, R7, #1   
            B Xcheck

      _exit:
            LDR r0,=Enx
            SWI 0x02
            MOV R0, #1
            SWI 0x11
