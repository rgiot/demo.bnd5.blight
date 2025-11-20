;;
; Memory AREA &8000-bfff contains the 4 crunched screens


	; Here we cannot use &8000 because (at least when writting that), some balls overlap
	org &9000

crunched_0000 : .start: incbin "CPC_A01.scr.zx0":.length = $-.start
crunched_4000 : .start: incbin "CPC_A02.scr.zx0":.length = $-.start
crunched_8000 : .start: incbin "CPC_A03.scr.zx0":.length = $-.start
crunched_c000 : .start: incbin "CPC_A04.scr.zx0":.length = $-.start


;;
; HL=crunched address
; bc=crunch size
; C2 screen conf mandatory
c2_copy_crunched_screen_in_buffer
	ld de, buffer_for_crunched_screens
	ldir
	ret

MAX_CRUNCHED_BUFFER_LENGTH = crunched_c000.length
if crunched_8000.length > MAX_CRUNCHED_BUFFER_LENGTH
	MAX_CRUNCHED_BUFFER_LENGTH = crunched_8000.length
endif
if crunched_4000.length > MAX_CRUNCHED_BUFFER_LENGTH
	MAX_CRUNCHED_BUFFER_LENGTH = crunched_4000.length
endif
if crunched_0000.length > MAX_CRUNCHED_BUFFER_LENGTH
	MAX_CRUNCHED_BUFFER_LENGTH = crunched_0000.length
endif

