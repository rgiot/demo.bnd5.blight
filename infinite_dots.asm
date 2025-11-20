
;;
; prerequisite : interruptions are cut
; Here the sprite does not change depending on the screen mode
; a dot is drwn by setting pen 0
infinite_dots_draw

	call infinite_dots_get_x_position
	; select the right display routine
	push af
		and %11
		ld e, a
		ld d, 0 
		ld hl, dots_pixels_mask
		add hl, de
		ld a, (hl)
		ld (.draw_mask), a
	pop af

	; select the right horizontal screen address
	srl a : srl a
	ld b, 0 : ld c, a


	; move vertically
	call infinite_dots_get_y_position

	ld h, high(relative_adresses)
	ld l, a
	ld e, (hl)
	inc h
	ld d, (hl)
	ex de, hl
	add hl, bc
	ex de, hl

	// todo select the right vertical screen address

	call depth_get_screen_basis
	add hl, de

	; XXX hl is not modified so ti is ok
	call c1c2c3_select_drawing_memory_configuration
		ld a, 0 : .draw_mask equ $-1
		and (hl) : ld (hl), a
	call c1c2c3_select_demosystem_memory_configuration
	ret
	
infinite_dots_get_x_position
	ld hl, spiral_x_coords.start : .table equ $-2
.restart
	ld a, (hl)
	inc hl
	; inc hl
	ld (.table), hl
	
	ld de, spiral_x_coords.stop
	or a : sbc hl, de
	ret c

	ld hl, spiral_x_coords.start
	jr .restart

	ret


infinite_dots_get_y_position
	ld hl, spiral_y_coords.start : .table equ $-2
.restart
	ld a, (hl)
	inc hl
	; inc hl
	ld (.table), hl

	ld de, spiral_y_coords.stop
	or a : sbc hl, de
	ret c

	ld hl, spiral_y_coords.start
	jr .restart
	ret


dots_pixels_mask
	db 0b_0111_0111
	db 0b_1011_1011
	db 0b_1101_1101
	db 0b_1110_1110
