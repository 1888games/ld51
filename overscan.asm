

; 29 lines of overscan
	TIMER_SETUP 37        
        ;
      ; jmp NoFlash
        
        lda FrameCounter
        and #%00000111
        bne NoFlash
        
        lda Brightness
        clc
        adc #2
        cmp #7
        bcc NoWrap2
        
        
        
        lda #1
        
NoWrap2:
	
	sta Brightness
        
	ldx #5
        
Loop:
	
        lda GridData,x
        and #%11110000
        cmp GridData,x
        beq Frozen
        
        lsr
        lsr
        lsr
        lsr
        tay
        
        lda IndexLookup,y
        tay
        
        lda ColourLookup,y
        clc
        adc Brightness
        sta GridData,x
 
Frozen:
        inx
        cpx #GRID_SIZE
        bcc Loop
        


