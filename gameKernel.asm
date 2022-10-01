	TIMER_SETUP 192
        
ResetForGame:	
		
                lda #0
                sta PF0
                
                lda #BACKGROUND_COLOR
                sta BackgroundColour
       		; Start our scanline count (gets decremented)
		ldx #0
                ldy #BLOCK_HEIGHT
                
                lda #5
                sta EndID
                
   jmp StartKernal
   
    	.align 256  
StartKernal:
	
            
        DRAW_GRID
        DIVIDER

        ldx #5
        ldy #BLOCK_HEIGHT

	lda #GRID_SIZE
	sta EndID
       
        DRAW_GRID
        
        jmp Finished
        
        sta WSYNC
        sta WSYNC
        sta WSYNC
        sta WSYNC
        sta WSYNC
        sta WSYNC
        
        lda #BACKGROUND_COLOR_2
        sta BackgroundColour
        sta COLUBK
        
        DIVIDER

        ldx #GRID_SIZE
        ldy #BLOCK_HEIGHT

	lda #GRID_SIZE + 5
	sta EndID
        
        DRAW_GRID
        DIVIDER
           
        ldx #GRID_SIZE + 5
        ldy #BLOCK_HEIGHT

	lda #GRID_SIZE * 2
	sta EndID
        
        DRAW_GRID


       
Finished:
           
        TIMER_WAIT