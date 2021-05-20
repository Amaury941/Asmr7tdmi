.global  _start
  

.text

_start
      LDR R0,=INarray
      LDR R2,=OUTarray
      LDR R4,=factor
      LDR R1, [R4]
      LDR R4,=lenght
      LDR R3, [R4]   
      MOV R4, #0

check:
      CMP R3,#0             
      BNE loop
      B _exit

loop:
      LDR R5,[R0],#4             
      MUL R4, R5, R1
      STR R4,[R2],#4  
      SUB R3, R3, #1
      B check

_exit:
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

      SWI 0

.data

factor: .word 3
lenght: .word 8                                            
INarray: .word 1,2,3,4,5,6,7,8     
OUTarray: .word 0,0,0,0,0,0,0,0
