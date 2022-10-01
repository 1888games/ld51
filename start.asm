

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code segment

	seg Code
        org $f000

Start

CheckFire:

	lda #%10000000
        bit INPT4
        ; bmi CheckFireS
             
            lda INTIM       ; unknown value
            sta Rand8       ; use as seed
            bne SeedOk

            inc Rand8

SeedOk:		

	
          lda #1
          sta CTRLPF
          
          lda #0
          sta COLUBK
          sta PF1
          sta PF0
          sta PF2
          sta ENABL
          sta ENAM0
          sta ENAM1
          
          
          lda #COLOUR_5
          sta GridData
          sta GridData + 1
          sta GridData + 2
          sta GridData + 3
          sta GridData + 4
        
          ldx #GRID_COLUMNS
            
GenerateLoop:
       		
          jsr Random
          and #%00000011
          tay
          lda ColourLookup,y
          sta GridData,x
            
          inx
          cpx #GRID_SIZE
          bcc GenerateLoop
         
