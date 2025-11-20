
c2_logo_reset
	xor a
	ld (logo_data.logo_line), a
	ld (logo_data.step), a
	ret

c2_logo_handle
	ld a, 0
.activated equ $-1
	or a  : ret z


	ld a, (logo_data.logo_line) : cp LOGO_HEIGHT*2 : jp z, .finished

	BORDER &59
	call c2_logo_copy_line_in_buffer

	BORDER &40
	call c1c2c3_select_drawing_memory_configuration
	call c1c3_logo_display_line
	call c1c2c3_select_demosystem_memory_configuration

	; loop on the 4 buffers
	ld a, (logo_data.step) : inc a : and %11 : ld (logo_data.step), a
	ret nz
	; request the next line
	ld a, (logo_data.logo_line) : inc a : ld (logo_data.logo_line), a
	ret
.finished
	; activate vumeters
	ld a, 1
.vumeter_activation equ $-1
	ld (split_border_in_pixels_zone.activated), a
	ret

logo_data
.logo_line dw 0
.step db 0


;;
; Copy a complete line from the drawing buffer to the screen
c1c3_logo_display_line
	; Compute the destination address
	ld a, (logo_data.logo_line)
	call depth_get_screen_address_for_line

	; Get the line of the logo to read and copy
	ld bc, buffer_for_logo_line
	ld a, LOGO_WIDTH
	ld de, c1c3_logo_disply_remove_background
	ex de, hl

	; HL = the table of mask and transformed pixels
	; BC = the input line buffer
	; DE = the output screen buffer
.loop
	ex af, af'
		ld a, (bc) : ld l, a : inc c   ; get the byte to write in l to setup the table properly
		ld a, (de) : and (hl)   ; mask the screen
		inc h : or (hl) : dec h ; add the pixels to masked screen
		ld (de), a : inc e ; write the screen
	ex af, af'
	dec a : jr nz, .loop
	ret


function logo_clip_pen pen
	if {pen} == 2
		return 0
	else
		return {pen}
	endif
endf

; we create a mask to keep only the pixels where there is background
function logo_mask_pen pen
	if {pen} == 2
		return 3  ; keep everything
	else
		return 0  ; keep nothing
	endif
endf

	align 256
c1c3_logo_disply_remove_background
	.mask 
	repeat 256, src, 0
		@p0 = mode1_byte_to_pen_at({src}, 0)
		@p1 = mode1_byte_to_pen_at({src}, 1)
		@p2 = mode1_byte_to_pen_at({src}, 2)
		@p3 = mode1_byte_to_pen_at({src}, 3)


		@tgt = pens_to_mode1_byte(logo_mask_pen(@p0), logo_mask_pen(@p1), logo_mask_pen(@p2), logo_mask_pen(@p3))
		db @tgt
	endr

	.byte_transformation
	repeat 256, src, 0
		@p0 = mode1_byte_to_pen_at({src}, 0)
		@p1 = mode1_byte_to_pen_at({src}, 1)
		@p2 = mode1_byte_to_pen_at({src}, 2)
		@p3 = mode1_byte_to_pen_at({src}, 3)


		@tgt = pens_to_mode1_byte(logo_clip_pen(@p0), logo_clip_pen(@p1), logo_clip_pen(@p2), logo_clip_pen(@p3))
/*
		@p0_ = mode1_byte_to_pen_at(@tgt, 0)
		@p1_ = mode1_byte_to_pen_at(@tgt, 1)
		@p2_ = mode1_byte_to_pen_at(@tgt, 2)
		@p3_ = mode1_byte_to_pen_at(@tgt, 3)

		assert @p0 == @p0_
		assert @p1 == @p1_
		assert @p2 == @p2_
		assert @p3 == @p3_
		assert {src} == @tgt
*/
		db @tgt
	endr