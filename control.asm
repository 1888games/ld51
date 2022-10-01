NoFlash:    

COOLDOWN = 4

	lda Cooldown
        beq CanControl
        
        dec Cooldown
        jmp ExitControl
     

CanControl:

	lda Temp
        beq CheckFire2
        
        jmp ExitControl

CheckFire2:
	
        ldx SelectedColumn
        lda GridData + 45,x
        cmp #BACKGROUND_COLOR
        bne NotEmpty

	 jsr Random
         and #%00000011
         tay
         lda ColourLookup,y
         sta GridData + 45,x
 
NotEmpty:
	lda #%10000000
        bit INPT4
        bmi NoFire
        
Firing:     
	
        ldx SelectedColumn
        
        
        lda #COOLDOWN
        sta Cooldown
        
        lda GridData+40,x
        cmp #BACKGROUND_COLOR
        bne NoFire
        
        lda GridData+ 45,x
        sta GridData+40,x
        
        lda #BACKGROUND_COLOR
        sta GridData+45,x
         
        
        
        ;inc fireHeld

NoFire:
	

MoveJoystick

	lda #%00010000	;Up?
	bit SWCHA
	bne SkipMoveUp
        
JoystickUp:

	
        lda #COOLDOWN
        sta Cooldown
        
    
SkipMoveUp
	lda #%00100000	;Down?
	bit SWCHA 
	bne SkipMoveDown
 
JoystickDown:

       
       
SkipMoveDown
	

	lda #%01000000	;Left?
	bit SWCHA
        bne SkipMoveLeft
        
        
JoystickLeft:

	lda #COOLDOWN
        sta Cooldown
        
        ldx SelectedColumn
        beq SkipMoveLeft
        
        dec SelectedColumn
    
        lda GridData + 45,x
        sta GridData + 44,x
        
       	lda #BACKGROUND_COLOR
        sta GridData + 45,x
        

SkipMoveLeft
	lda #%10000000	;Right?
	bit SWCHA 
        bne SkipMoveRight
        
JoystickRight:
        

        lda #COOLDOWN
        sta Cooldown
        
        
        ldx SelectedColumn
        cpx #4
        beq SkipMoveRight
        
        inc SelectedColumn
    
        lda GridData + 45,x
        sta GridData + 46,x
        
       	lda #BACKGROUND_COLOR
        sta GridData + 45,x
        
        
        
        
SkipMoveRight
	
ExitControl:	