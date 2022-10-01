

        
placeSprite:
                cpx     #$02
                adc     #$00
                clc
                adc     #$2e
                sec
                sta     WSYNC
               
divideLoop:    
                sbc     #$0F
                bcs     divideLoop
                sta     RESP0,X
                eor     #$ff
                adc     #$f9
                asl
                asl
                asl
                asl
                sta     HMP0,X
                rts
                
                
;Adds value to 6-BCD-digit score.
; A = 1st BCD digit
; X = 2nd BCD digit
; Y = 3rd BCD digit

AddScore: 
        sed	; enter BCD mode
        clc	; clear carry
        sta Temp
        ;lda BCDScore
        adc Temp
        ;sta BCDScore
        stx Temp
        ;lda BCDScore+1
        adc Temp
        ;sta BCDScore+1
        sty Temp
        ;lda BCDScore+2
        adc Temp
        ;sta BCDScore+2
        cld	; exit BCD mode
        rts

Random:
        lda Rand8
        lsr
 
        bcc noeor
        eor #$B4 
noeor 
        sta Rand8
 
        rts


     