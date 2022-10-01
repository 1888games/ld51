
NextFrame
        lsr SWCHB	; test Game Reset switch
        bcc Start	; reset?
        
                
; 1 + 3 lines of VSYNC
	VERTICAL_SYNC
; 37 lines of underscan
	TIMER_SETUP 37
        
        
        TIMER_WAIT