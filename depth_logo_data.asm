
LOGO_WIDTH = 64
LOGO_HEIGHT = 4*8


;;
; Copy the selected line in the drawing buffer
c2_logo_copy_line_in_buffer
	; Get the line of the logo to read and copy
	ld a, (logo_data.logo_line)
	srl a // divide by two to duplicate
	ld h, 0: ld l, a
	add hl, hl ; x2
	add hl, hl ; x4
	add hl, hl ; x8
	add hl, hl ; x16
	add hl, hl ; x32
	add hl, hl ; x64
	ld de, c2_logo_data
	add hl, de

	; Destination is always the same buffer
	ld de, buffer_for_logo_line
	ld bc, LOGO_WIDTH
	ldir
	ret


c2_logo_data1
c2_logo_data
.start
	incbin "logo.spr"
.end



	print "AFTER LOGO DATA", {hex}$


