
BRIGHTNESS = 1

    	IF COMPILE_VERSION = NTSC
   
GRAY = $00
YELLOW = $10
ORANGE = $20
DARK_RED = $30
RED = $40
PURPLE = $50
VIOLET = $60
LIGHT_PURPLE = $70
BLUE = $80
CYAN = $A0
BLUE_GREEN = $B0
GREEN = $D0
DARK_GREEN = $E0
BROWN = $F0


BACKGROUND_COLOR = GRAY
BACKGROUND_COLOR_2 = GRAY


COLOUR_1 = YELLOW + 8
COLOUR_2 = RED + 4
COLOUR_3 = BLUE + 6
COLOUR_4 = GREEN + 6
COLOUR_5 = GRAY + 7



    	ELSE
    
GRAY = $00
YELLOW = $20
GREEN = $30
BROWN = $40
DARK_GREEN = $50
RED = $60
CYAN = $70
PINK = $80
LIGHT_BLUE = $90
PURPLE = $A0
BLUE = $B0
VIOLET = $C0
DARK_BLUE = $D0


BACKGROUND_COLOR = #$5F

COLOUR_1 = YELLOW + BRIGHTNESS
COLOUR_2 = DARK_RED + BRIGHTNESS
COLOUR_3 = YELLOW + BRIGHTNESS
COLOUR_4 = YELLOW + BRIGHTNESS
COLOUR_5 = YELLOW + BRIGHTNESS
COLOUR_6 = YELLOW + BRIGHTNESS

    	ENDIF
    