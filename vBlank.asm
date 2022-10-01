
NextFrame
        lsr SWCHB	; test Game Reset switch
        bcc Start	; reset?
        
                
; 1 + 3 lines of VSYNC
	VERTICAL_SYNC
; 37 lines of underscan
	TIMER_SETUP 35
        	
        lda #0
        sta VBLANK
      

        TIMER_WAIT
        
        lda #15
        sta COLUBK
        
        sta WSYNC
     
        lda #0
        sta COLUBK
        