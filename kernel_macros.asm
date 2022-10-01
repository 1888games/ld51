	MAC DRAW_GRID
        
.GameKernal:

	sta WSYNC		;67	
    
        lda #PF1_On		;2
        sta PF1			;5	
        
        lda #PF2_On		;7
        sta PF2 		;10
        
        lda GridData + 0,x	;14				;14
        sta COLUPF		;17
	
        lda BackgroundColour
        sta COLUBK
   
        SLEEP 6		;29
        
        lda GridData + 1,x	;33				;33	
        sta COLUPF		;36	
        
        SLEEP 3			;39

        
        lda GridData + 2,x	;43			
        sta COLUPF		;46
        
        lda GridData + 3,x	;50				;50	
        sta COLUPF		;53
       
        lda GridData + 4,x	;57	;;57	
        sta COLUPF		;60

    	dey			;62
        bpl .GameKernal		;64

        lda #0			;66
        sta PF2			;69
        sta PF1			;72
        
        
        ldy #BLOCK_HEIGHT
        
    
        
.EndRow:
                
	txa
        clc
        adc #GRID_COLUMNS
        tax

        cpx EndID
        beq .Finished
        
        
       
        
        jmp .GameKernal
        
       
.Finished:



	ENDM
        
     MAC DIVIDER      
        
        lda #15
        sta COLUBK
        
        sta WSYNC
        
        lda #0
        sta COLUBK
        
        
       
    ENDM