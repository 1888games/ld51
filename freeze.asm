

	lda FrameCounter
        cmp #FPS * 2
        bcc NoIncrease
        
        lda #0
        sta FrameCounter
        
        ldx #0
        
CheckNew:

	lda GridData,x
        cmp #BACKGROUND_COLOR
        beq FoundIt
        
        inx
        cpx #5
        bcc CheckNew
        
        jsr MoveDown
        jmp NoIncrease
        
FoundIt:

	 jsr Random
         and #%00000011
         tay
         lda ColourLookup,y
         and #%11110000
         ;clc
         ;adc #15
         sta GridData,x

	 jmp EndFrame

	
        
NoIncrease:

	lda FrameCounter
        and #%00000001
        sta Temp
        bne EndFrame
        
       	ldx #5
        ldy #6
        
RowLoop:

	txa
        clc
        adc #5
        sta EndID
 
RiseLoop:

	lda GridData,x
        cmp #BACKGROUND_COLOR
        bne NextX
        
        lda GridData + 5,x
        cmp #BACKGROUND_COLOR
        beq NoMove
        
        inc Temp  
        sta GridData,x
        
        lda #BACKGROUND_COLOR
        sta GridData + 5,x
        
NoMove:       

NextX:
	
        inx
        cpx EndID
        bcc RiseLoop
        
        dey
        bpl RowLoop
	
        
        
        
EndFrame: 


        TIMER_WAIT
; total = 262 lines, go to next frame
        jmp NextFrame

	



MoveDown: 
	ldx #0

MoveLoop
        lda GridData + 40,x
        cmp #BACKGROUND_COLOR
        bne GameOver
        
        lda GridData + 35,x
        sta GridData + 40,x
        
        lda GridData + 30,x
        sta GridData + 35,x
        
        lda GridData + 25,x
        sta GridData + 30,x

  	lda GridData + 20,x
        sta GridData + 25,x
        
	lda GridData + 15,x
        sta GridData + 20,x
        
        lda GridData + 10,x
        sta GridData + 15,x
        
        lda GridData + 5,x
        sta GridData + 10,x
        
        lda GridData + 0,x
        sta GridData + 5,x
        
        lda #BACKGROUND_COLOR
        sta GridData,x
        
        inx
        cpx #5
        bcc MoveLoop


GameOver:

	rts