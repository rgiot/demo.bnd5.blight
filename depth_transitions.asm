handle_screen_height_increase
	ld a, 1
.counter equ $-1

	cp (256/8)+1 : jr z, .over



	ld bc, 0xbc00 + 6
	out (c), c : inc b : out (c), a
	inc a
	ld (.counter), a
	ret
.over
	ld a, 1
	ld (c2_logo_handle.activated), a
	ret


handle_screen_height_decrease
	; deactivate vumeter
	xor a
	ld (c2_logo_handle.vumeter_activation), a

	ld a, 256/8
.counter equ $-1


	ld bc, 0xbc00 + 6
	out (c), c : inc b : out (c), a
	dec a
	ld (.counter), a
	
	cp 1
	jp  z, execute_frame_reset
	ret

activate_big_sprite
	ld a, 1
	ld (depth_run.big_sprite_activated), a
	ret


infinite_sprite_change
	ld hl, infinite_sprites_configuration
.table equ $-2

	ld a, (hl) : ld (infinite_sprite_draw.nb_horizontal_steps), a
	inc hl

	ld a, (hl) : ld (infinite_sprite_draw.nb_vertical_steps), a
	inc hl

	ld (infinite_sprite_change.table), hl
	
	ld a, (hl) : or a : ret nz

.reset
	ld hl, infinite_sprites_configuration
	ld (infinite_sprite_change.table	), hl
	ret



infinite_sprites_configuration
	; vertical move
	db 1, 1
	db 1, 2
	db 3, 1
	db 2, 2
	db 2, 1	
	db 1, 3
	db 0


palette_change
	BREAKPOINT
	ld hl, palette_configuration + 4
.pointer equ $-2

	ld de, depth_palette
	ldi : ldi : ldi : ldi

	ld (.pointer), hl
	
	ld a, (hl)
	or a
	ret nz

	ld hl, palette_configuration
	ld (.pointer), hl

	ret


frame_selection
	ld a, 0
.frame equ $-1
	inc a
	and 1
	or a
	ld (.frame), a
	jp z, .frame2
.frame1
	ld hl, frames_configuration
	jp .select
.frame2
	ld hl, frames_configuration_up
.select

	ld (handle_next_frame_selection.selected_table), hl

	ret

palette_configuration
	dw GA_COL_26*256 + GA_BLACK, GA_COL_14*256 + GA_COL_05
	dw GA_COL_26*256 + GA_BLACK, GA_COL_20*256 + GA_COL_10
	dw GA_COL_25*256 + GA_BLACK, GA_COL_14*256 + GA_COL_12 ; ok bof
	dw GA_COL_25*256 + GA_BLACK, GA_COL_15*256 + GA_COL_03 ; => blanc en jaune
	dw GA_COL_23*256 + GA_BLACK, GA_COL_13*256 + GA_COL_10 ; => blanc en 23
	db 0

