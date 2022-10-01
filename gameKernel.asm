	TIMER_SETUP 192
        
ResetForGame:	
		
                lda #0
                sta PF0
       		; Start our scanline count (gets decremented)
		ldx #0
                ldy #BLOCK_HEIGHT
                
   jmp GameKernal
   
    	.align 256  
                
GameKernal:

	sta WSYNC		;67	
    
        lda #PF1_On		;2
        sta PF1			;5	
        
        lda #PF2_On		;7
        sta PF2 		;10
        
        lda GridData + 0,x	;14				;14
        sta COLUPF		;17
        
        lda (BoxPointer),y	;22
	sta GRP0		;25
	
        SLEEP 4			;29
        
        lda GridData + 1,x	;31				;33	
        sta COLUPF		;36	
        
        SLEEP 3			;39
        
        lda GridData + 2,x	;43			
        sta COLUPF		;46
        
        lda GridData + 3,x	;48				;50	
        sta COLUPF		;53
       
        lda GridData + 4,x	;55	;;57	
        sta COLUPF		;60
       
     
       	dey			;70
        bpl GameKernal		;72
        
        ;ldy #GAP_HEIGHT		;67
        

        lda #0			;69
        sta PF2			;72
        sta PF1			;75
        sta GRP0
        ;sta drawBox
        
BlankLoop:        
  
        sta WSYNC
        
        ;dey
        ;bpl BlankLoop
        
        ldy #BLOCK_HEIGHT
        
                 
EndRow:
                
	txa
        clc
        adc #5
        tax
  	
 
        cpx #40
        beq Finished
        
        jmp GameKernal
        
       
Finished:
           
        TIMER_WAIT