COMPILED_FALLING_SPRITE=true  ; not compiled is way too slow

FALLING_SPRITE_WIDTH=13
FALLING_SPRITE_HEIGHT=40

;;
; Prerequisite: interruptions are cut to not write in &38
; Here the sprite changes depending on the screen mode
depth_draw_big_sprite
	; Select the appropriate GA configuration
	call c1c2c3_select_drawing_memory_configuration

	; select the appropriate sprite routine
	call depth_get_ink_variant
	jr nz, .variant1
.variant2
	ld hl, falling_sprite_odd_asm
	jr .continue
.variant1
	ld hl, falling_sprite_even_asm
.continue
	ld (.called), hl

	; select the appropriate memory space
	call depth_get_screen_basis
	; and move it
	ld de, 64*6 + (64-14)/2 +1: .delta equ $-2
	add hl, de
	
	call falling_sprite_even_asm : .called equ $-2
	

	; Restore the screen mode
	call c1c2c3_select_demosystem_memory_configuration
	ret


if COMPILED_FALLING_SPRITE
	include "falling_sprite_odd.asm"
	include "falling_sprite_even.asm"
else


falling_sprite_odd_asm
	ld de, falling_sprite_odd
	ld bc, falling_sprite_mask
	call falling_sprite_display

falling_sprite_even_asm
	ld de, falling_sprite_even
	ld bc, falling_sprite_mask
	call falling_sprite_display


falling_sprite_display
	repeat FALLING_SPRITE_HEIGHT
		call falling_sprite_display_line
	endr
	ret

falling_sprite_display_line
	push hl
	repeat FALLING_SPRITE_WIDTH, step
		ld a, (bc) : inc bc
		and (hl) : ex de, hl : or (hl) : ex de, hl
		inc l
		if {step} != FALLING_SPRITE_WIDTH
			inc de
		endif
	endr
	pop hl
	call universal_bc26_r1_32

	ret

falling_sprite_odd
	incbin "falling_sprite_odd.spr"
falling_sprite_even
	incbin "falling_sprite_even.spr"
falling_sprite_mask
	incbin "falling_sprite_even.msk"

		IFNDEF universal_bc26_r1_32
universal_bc26_r1_32
	LD A, H
	ADD 0x8
	LD H, A
	AND 0x38
	RET NZ
	LD A, 0x40
	ADD L
	LD L, A
	LD A, 0xc0
	ADC H
	LD H, A
	RES 0x3, H
	RET

	ENDIF

endif