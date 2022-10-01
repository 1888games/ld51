

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
          sta Brightness
          
          lda #BACKGROUND_COLOR
          sta COLUBK
          
          lda #0
          sta PF1
          sta PF0
          sta PF2
          sta GRP0
          sta GRP1
          sta ENAM0
          sta ENAM1
          sta ENABL
          
          lda #2
          sta SelectedColumn
          
    
          ldx #GRID_SIZE
          lda #BACKGROUND_COLOR
          ldy #BACKGROUND_COLOR_2
          
          
ClearGrid:
			
          sta GridData,x
          sty GridData + GRID_SIZE,x
          dex
          bpl ClearGrid
          
          ldx #5
            
GenerateLoop:
       		
          jsr Random
          and #%00000011
          tay
          lda ColourLookup,y
          sta GridData,x
            
          inx
          cpx #15
          bcc GenerateLoop

          ldx #GRID_SIZE + 5
            
GenerateLoop2:
       		
          jsr Random
          and #%00000011
          tay
          lda ColourLookup,y
          sta GridData,x
            
          inx
          cpx #GRID_SIZE + 15
          bcc GenerateLoop2
         
         
          jsr Random
          and #%00000011
          tay
          lda ColourLookup,y
          sta GridData + GRID_SIZE - 3
            
        
        
Generate         