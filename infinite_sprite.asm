; Some references
; https://www.youtube.com/watch?v=ztgxHCklN7s


infinite_sprite_init
	ld hl, c2_spiral_z_data
	ld (infinite_sprite_draw.depth), hl
	ret

;;
; prerequisite : interruptions are cut
; Here the sprite does not change depending on the screen mode
infinite_sprite_draw

	ld b, 2
.nb_horizontal_steps equ $-1
.nb_horizontal_steps_loop
	push bc
		call infinite_sprite_get_x_position
	pop bc
	djnz .nb_horizontal_steps_loop


	; get the appropriate depth
	; TODO do it programmatically instead of using a fucking big table
	ld hl, c2_spiral_z_data : .depth equ $-2
	ld e, (hl)
	inc hl : ld (.depth), hl
	ld d, 0
	ld hl, pearl_table
	add hl, de


	; select the right display routine
	push af
		and %11
		add a : ld e, a
		ld d, 0 
		add hl, de
		ld e, (hl) : inc hl : ld d, (hl)
		ld (.draw_routine), de
	pop af

	; select the right horizontal screen address
	srl a : srl a
	ld c, a

	; move vertically
	ld b, 2
.nb_vertical_steps equ $-1
.nb_vertical_steps_loop
	push bc
		call infinite_sprite_get_y_position
	pop bc
	djnz .nb_vertical_steps_loop

	call depth_get_screen_address_for_line_and_pos

	// todo select the right vertical screen address

	

	; copy the sprite routine
	; assume we are in demosystem memory configuration
	push hl
		ld hl, 0xdead : .draw_routine equ $-2
		call infinite_sprite_copy_sprite_routine
	pop hl


	; XXX hl is not modified so ti is ok
	call c1c2c3_select_drawing_memory_configuration
	call buffer_for_infinite_sprite_routine ; copy the ball with the appropriate routine
	call c1c2c3_select_demosystem_memory_configuration
	ret
	
infinite_sprite_get_x_position
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

infinite_sprite_get_y_position
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


;;
; The sprite routine IS NOT in a memory area compatible with the demo effects.
; IT HAS TO BE copied in space 0xc000-0xfff before being used
; Input:
; HL = adress of the sprite routine
infinite_sprite_copy_sprite_routine
	BORDER &5a
	ld bc, INFINITE_SPRITE_MAX_SIZE_ROUTINE
	ld de, buffer_for_infinite_sprite_routine
	ldir
	BORDER &4c
	ret




