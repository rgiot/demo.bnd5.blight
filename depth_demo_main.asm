;;
; This file contains all the code that must be accessible in c1,c2,c3 configurations

	include once "inner://ga.asm"
	include once "depth_crtc_transition.asm"

	MUSIC_AT_100HZ equ true

NB_FRAMES_BEFORE_RESET = CURVE_LENGTH - 256/8 + 1
BORDER_INK equ 0x54
SHOW_DOTS equ false


;;; Warning, you cannot have persistent code from stack_start to depth_run.stack_stop
stack_start

depth_init

	
	
	di
		ld hl, 0xc9fb : ld (0x38), hl
	ei
	DS_CRTC_VERTICAL_TRANSITION_ONLY_NO_MUSIC(&1e, 34)
	halt : DS_CRTC_HORIZONTAL_TRANSITION_ONLY(&2e, 32+10)


	call TestCRTC
;	db &ed, &ff
	cp 0 : jp z, crtc_0
	cp 3 : jp z, crtc_0
	cp 4 : jp z, crtc_0
crtc_1
	ld hl, split_border_setup_crtc1
	jp crtc_continue
crtc_0
	ld hl, split_border_setup_crtc0

crtc_continue
	ld (split_border_in_pixels_zone.crtc_routine), hl

	di
	; TODO add crtc transitions

	call infinite_sprite_change


;	WRITE_CRTC(7, 34)
;	WRITE_CRTC(2, 32+10)

	;WRITE_CRTC(6, 32)
	;WRITE_CRTC(1, 32)
	WRITE_CRTC(3, 0x8e)

	call c1c2c3_install_no_op_interrupt_handler


	ei
	ret


	
depth_run
	defs 40, 0 ; 10 extra bytes for the stack
.stack_stop
	ld sp, $


	call c2_music_init
	call c1c2c3_install_music_interrupt_handler
	call depth_uncrunch_all_screens
	call c1c2c3_install_no_op_interrupt_handler

.frame_loop
	ld b, 0xf5
.frame_loop_no_vsync
	 in a, (c) : rra : jr nc, .frame_loop_no_vsync
	
	WRITE_CRTC(1, 32)

	call handle_screen_height_increase
.screen_height_transition equ $-2

	call handle_frame_reset

	call depth_select_current_palette
	call handle_next_frame_selection ; XXX important to do it before everything
	                                 ;     as it setup GA configuration for next frame

	call equalizers_handling
	halt
	di
	
		if USE_LOGO_SPLITS
			; Handle the split stuff around the logo
			defs 26 - 4 - 4 - 3  ; wait to start the code at the appropriate position
			call split_rasters_in_border_zone
		endif

		if USE_LOGO_BACKROUND_RASTER
			call rasters_under_logo
		endif

		; Handle the split border overlayed on the balls
		defs 37 + 2
		call split_border_in_pixels_zone

		BREAKPOINT
		call c2_play_music

	;di
		BORDER &55
		call infinite_sprite_draw : .routine_called equ $-2
		;call infinite_dots_draw
		BORDER &4b

		ld a, 0
.big_sprite_activated equ $-1
		or a
		call nz, depth_draw_big_sprite

		call c2_logo_handle
		BORDER &54
	ei


	call depth_select_next_crtc_value

	jp .frame_loop


;;
; Setup properly the bytes to handle the interrupted code (even in the graph)
c1c2c3_install_no_op_interrupt_handler
	ld a, 0xc3 
	ld (0x38), a; JP
	ld hl, c1c2c3_interrupted_code.leave_interrupted_code
	ld (0x39), hl
	ret

; Setup properly the bytes to handle the interrupted code (even in the graph)
c1c2c3_install_music_interrupt_handler
	ld a, 0xc3 
	ld (0x38), a; JP
	ld hl, c1c2c3_interrupted_code
	ld (0x39), hl
	ret


depth_palette

	if false ; samourai
		dw GA_COL_26*256 + GA_COL_0
		dw GA_COL_5*256 + GA_COL_14
	else if false ; assassin
		dw GA_COL_26*256 + GA_COL_0
		dw GA_WHITE*256 + GA_CYAN
	else
		dw GA_COL_26*256 + GA_BLACK
		dw GA_COL_14*256 + GA_COL_05 ; OK
		;dw GA_COL_13*256 + GA_COL_10 ; => blanc en 23

	endif

; output A=position in animation
depth_select_next_crtc_value
	ld de, 0xc000 : .crtc_address equ $ -2
	ld bc, 0xbc00 + 12
	out (c), c : inc b: out (c), d : dec b : inc c
	out (c), c : inc b : out (c), e
	ret

depth_select_current_palette
	ld bc, 0x7f00
	ld de, (depth_palette+0)
	ld hl, (depth_palette+2)

	out (c), c : inc c : out (c), d
	out (c), c : inc c : out (c), e
	call .variant1 : .variant_selection equ $-2

	ret

.variant1
	out (c), c : inc c : out (c), h
	out (c), c : inc c : out (c), l

	if USE_LOGO_BACKROUND_RASTER
		;ld a, 2
		;ld (rasters_under_logo.selected_ink), a
		ld (rasters_under_logo.restore_palette), hl
	endif
	ret


.variant2
	out (c), c : inc c : out (c), l
	out (c), c : inc c : out (c), h

	if USE_LOGO_BACKROUND_RASTER
		;ld a, 3
		;ld (rasters_under_logo.selected_ink), a
		ld a, h : ld h, l : ld l, a
		ld (rasters_under_logo.restore_palette), hl
	endif
	ret


;;
; Handle the various changes required to make a proper animation
handle_next_frame_selection
.compute_next_position
	ld a, 0: .pos equ $-1
	inc a : and NB_FRAMES_IN_ANIMATIONS-1 : ld (.pos), a

	assert FRAME_CONF_SIZE == 7 
	ld e, a
	add a : add a : add a : sub e

	ld d, 0 : ld e, a
	ld hl, frames_configuration
.selected_table equ $-2
	add hl, de

.read_crtc_address
	ld e, (hl): inc hl : ld d, (hl) : inc hl
	ld (depth_select_next_crtc_value.crtc_address), de

.read_ga_conf
	ld a, (hl) : inc hl
	ld (c1c2c3_select_drawing_memory_configuration.ga_conf), a

.read_logical_memory
	ld e, (hl): inc hl : ld d, (hl) : inc hl
	ld (depth_get_screen_basis.base_screen), de
	

.read_palette_routine
	ld e, (hl): inc hl : ld d, (hl) : inc hl
	ld (depth_select_current_palette.variant_selection), de

	ret


;;
; Input: a configuration
c1c2c3_setup_drawing_memory_configuration
	ld (c1c2c3_select_drawing_memory_configuration.ga_conf), a
	ret

; Selct c1 or c3
c1c2c3_select_drawing_memory_configuration
	ld bc, &7fc1 : .ga_conf equ $-2 
	jr c1c2c3_select_memory_configuration

c1c2c3_select_demosystem_memory_configuration
	ld bc, &7fc2
	; execute directly c1c2c3_select_memory_configuration
;;
; BC=7fXX with XX in c1 c2c 3
; Select the memory state and save it
c1c2c3_select_memory_configuration
.save
	ld (.backup), bc
.apply
	out (c), c
	ret
.backup dw 0

c2_restore_memory_configuration
	ld bc, (c1c2c3_select_memory_configuration.backup)
	jr c1c2c3_select_memory_configuration.apply

c1c2c3_force_demosystem_memory_configuration
	ld bc, &7fc2
	jr c1c2c3_select_memory_configuration.apply

depth_get_screen_basis
	ld hl, 0x4000 : .base_screen equ $-2
	ret

;;
; Return the address of the line of the current drawn screen
; Input : A number of the line
; output: HL: screen address for the given line
depth_get_screen_address_for_line
	ld h, high(relative_adresses)
	ld l, a
	ld e, (hl)
	inc h
	ld d, (hl)
	call depth_get_screen_basis
	add hl, de
	ret

; Input : A number of the line
; Input c: horizontal position
depth_get_screen_address_for_line_and_pos
	call depth_get_screen_address_for_line
	ld a, l : add c : ld l, a
	ret

depth_get_ink_variant
	ld hl, (depth_select_current_palette.variant_selection)
	ld bc, depth_select_current_palette.variant1
	or a : sbc hl, bc
	ld a, l : or h
	ret


handle_frame_reset
	ld hl, NB_FRAMES_BEFORE_RESET : .counter equ $-2
	dec hl
	ld (.counter), hl

	ld a, h : or l
	ret nz


	ld hl, handle_screen_height_decrease
	ld (depth_run.screen_height_transition), hl
	ret

execute_frame_reset
	call frame_selection

	ld hl, NB_FRAMES_BEFORE_RESET
	ld (handle_frame_reset.counter), hl

	call c1c2c3_install_music_interrupt_handler

	ld bc, 0x7f54 : xor a
	out (c),a : out (c), c : inc a
	out (c),a : out (c), c : inc a
	out (c),a : out (c), c : inc a
	out (c),a : out (c), c

	call depth_uncrunch_all_screens
	call depth_handle_next_effect
	call c2_logo_reset
	call c1c2c3_install_no_op_interrupt_handler

	ld hl, handle_screen_height_increase
	ld (depth_run.screen_height_transition), hl
	ld a, 1 : ld (handle_screen_height_increase.counter), a : ld (c2_logo_handle.vumeter_activation), a
	ld a, 256/8 : ld (handle_screen_height_decrease.counter), a
	xor a : ld (c2_logo_handle.activated), a : ld (split_border_in_pixels_zone.wait_before_big_logo), a : ld (depth_run.big_sprite_activated), a

	call infinite_sprite_change
	call palette_change
	pop hl ; consume the ret
	jp depth_run.frame_loop



;;
; Each time we restart, we launch a new effect
depth_handle_next_effect
	ld a, 0 : .counter equ $-1
	inc a : and 0b1 : ld (.counter), a

	add a
	ld d, 0 : ld e, a
	ld hl, .table
	add hl, de

	ld e, (hl) : inc hl : ld d, (hl) : inc hl
	ld (depth_run.routine_called), de

	call infinite_sprite_init ; TODO do it only when it is infinite sprite screnn !
	ret

.table
	dw infinite_sprite_draw
	dw infinite_sprite_draw
;	dw infinite_dots_draw


;;
; V0 interrupts must be cut. In V1 will do differently
; prerequisite: c2 configuration is set at start
depth_uncrunch_all_screens

		ld a, 0xc1 : call c1c2c3_setup_drawing_memory_configuration
		call c1c2c3_select_drawing_memory_configuration
		call c1c2c3_install_music_interrupt_handler
		call c1c2c3_select_demosystem_memory_configuration

		ld hl, crunched_0000.start : ld bc, crunched_0000.length ; source
		ld de, 0x4000 : ld a, 0xc1 ; destination
		call c2_uncrunch_screen
		call c1c2c3_select_drawing_memory_configuration

		di
			ld hl, 0x4000
			ld de, 0x0000
			ld bc, 0x100
			ldir
			push hl, de
				ld hl, (0x39) : ld a, (0x38)
				ld (.backup_39), hl
				ld (.backup_38), a
				call c1c2c3_install_music_interrupt_handler
			pop de, hl
		ei


		ld bc, 0x4000-0x100
		ldir

		call c1c2c3_select_demosystem_memory_configuration

		ld hl, crunched_4000.start : ld bc, crunched_4000.length ; source
		ld de, 0x4000 : ld a, 0xc1 ; destination
		call c2_uncrunch_screen

		ld hl, crunched_8000.start : ld bc, crunched_8000.length ; source
		ld de, 0x8000 : ld a, 0xc1 ; destination
		call c2_uncrunch_screen

		ld hl, crunched_c000.start : ld bc, crunched_c000.length ; source
		ld de, 0x4000 : ld a, 0xc3 ; destination
		call c2_uncrunch_screen


		di
			ld a, 0xc1 : call c1c2c3_setup_drawing_memory_configuration
			call c1c2c3_select_drawing_memory_configuration
				ld a, 0 : .backup_38 equ $-1
				ld hl, 0 : .backup_39 equ $-2
				ld (0x38), a
				ld (0x39), hl
			call c1c2c3_select_demosystem_memory_configuration
		ei

	ret

	include "inner://dzx0_fast.asm"
c1c2c3_uncrunch_zx0
	DecompressZX0()
	ret




c2_uncrunch_screen
	call c1c2c3_setup_drawing_memory_configuration

	; Copy crunched screen accessible only in c2 in buffer area accessible in c1/c3/c2 mode
	push de
		call c2_copy_crunched_screen_in_buffer
	pop de
	
	; uncrunch screen in the right area
	call c1c2c3_select_drawing_memory_configuration
	ld hl, buffer_for_crunched_screens
	; de already contains the appropriate address
	call c1c2c3_uncrunch_zx0

	call c1c2c3_select_demosystem_memory_configuration
	ret


/**
 * Original author: Longshot
 * http://cpcrulez.free.fr/coding_logon36.htm
 * Several modification from Madram for the 4deKades 4k
 *
 */
c1c2c3_interrupted_code
        push af, bc, de, hl

        ld      b ,0xf5         ; gestion periode compteur
        in a,(c)
        rra
        ld a,0   ; compteur inter
.interrupt_count equ $-1
        JR      NC, .NEXTI
        LD A,-1      ; 1ere Inter
.NEXTI
        INC A             ; Num Inter+l (1/300 x 6)
        CP      6               ; verif pas de pb ( Cas
        JR      C, .OK          ; de CRTC bizarroides )
        XOR A
.OK
        LD (.interrupt_count),A
        add     A               ; x 2 + TabVectInt

		ld d, 0: ld e, a
		ld hl, .TABINT
		add hl, de

        call c2_call_mem_hl

		; TODO check if it is not better to duplicate that
.RETOUR
		pop hl, de, bc, af

.leave_interrupted_code
        EI

        RET



.TABINT  
		DW INT1
        DW INT2
        DW INT3
        DW INT4
        DW INT5
        DW INT6
        DW INT2 
.TABINT_END


c2_call_mem_hl
	ld a, (hl) : inc hl
	ld h, (hl) : ld l, a
	jp (hl)
	ret

INT3
	exx : exa
		push af,  bc, de, hl, ix, iy
			call c1c2c3_force_demosystem_memory_configuration
				call c2_play_music
				call c2_restore_memory_configuration
		pop iy, ix, hl, de, bc, af
	exa : exx

INT1
INT2
INT4
INT5
INT6
    RET

;;
; This function must be here and is called by all sprite routines
c1c3_universal_bc26_r1_32
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

	include "infinite_sprite.asm"
	if SHOW_DOTS
		include "infinite_dots.asm"
	endif
	include "big_sprite.asm"
	include "depth_logo_code.asm"


	struct FRAME_CONFIGURATION
		crtc_address dw  	; the CRTC configuration for the screen
		ga_conf db
		logical_address dw
		palette_routine dw  ; The routine to call to properly handle the colorcycling
	ends

; TODO include GA configuration too
; Data to properly andle the frames
frames_configuration
	; CRTC adress, GA conf, logical memory address, palette routine
	FRAME_CONFIGURATION &3000, &c3, &4000, depth_select_current_palette.variant2
	FRAME_CONFIGURATION &2000, &c1, &8000, depth_select_current_palette.variant2
	FRAME_CONFIGURATION &1000, &c1, &4000, depth_select_current_palette.variant2
	FRAME_CONFIGURATION &0000, &c1, &0000, depth_select_current_palette.variant2

	FRAME_CONFIGURATION &3000, &c3, &4000, depth_select_current_palette.variant1
	FRAME_CONFIGURATION &2000, &c1, &8000, depth_select_current_palette.variant1
	FRAME_CONFIGURATION &1000, &c1, &4000, depth_select_current_palette.variant1
	FRAME_CONFIGURATION &0000, &c1, &0000, depth_select_current_palette.variant1
FRAME_CONF_SIZE equ 7
NB_FRAMES_IN_ANIMATIONS = ($-frames_configuration)/FRAME_CONF_SIZE
	assert NB_FRAMES_IN_ANIMATIONS == 8

	print "There are ", NB_FRAMES_IN_ANIMATIONS, " frames in the animation."

frames_configuration_up
	; CRTC adress, GA conf, logical memory address, palette routine
	FRAME_CONFIGURATION &0000, &c1, &0000, depth_select_current_palette.variant1
	FRAME_CONFIGURATION &1000, &c1, &4000, depth_select_current_palette.variant1
	FRAME_CONFIGURATION &2000, &c1, &8000, depth_select_current_palette.variant1
	FRAME_CONFIGURATION &3000, &c3, &4000, depth_select_current_palette.variant1

	FRAME_CONFIGURATION &0000, &c1, &0000, depth_select_current_palette.variant2
	FRAME_CONFIGURATION &1000, &c1, &4000, depth_select_current_palette.variant2
	FRAME_CONFIGURATION &2000, &c1, &8000, depth_select_current_palette.variant2
	FRAME_CONFIGURATION &3000, &c3, &4000, depth_select_current_palette.variant2


	;; 
	align 256
relative_adresses
	repeat 256, idx, 0
		db low(({idx} >> 3)*64 + 0x800*({idx} & 7))
	endr
	repeat 256, idx, 0
		db high(({idx} >> 3)*64 + 0x800*({idx} & 7))
	endr


buffer_for_infinite_sprite_routine
buffer_for_crunched_screens
	align 256
buffer_for_logo_line
	assert $ + INFINITE_SPRITE_MAX_SIZE_ROUTINE < 0x10000, "There is not enough space here to store the biggest sprite routine"
	assert $ + MAX_CRUNCHED_BUFFER_LENGTH < 0x10000, "There is not enough space to store a screen to uncrunch"
	assert $ + LOGO_WIDTH < 0x10000, "There is not enough space to store one line of logo"

MAX_BUFFER_SIZE = max(INFINITE_SPRITE_MAX_SIZE_ROUTINE, max(MAX_CRUNCHED_BUFFER_LENGTH, LOGO_WIDTH))

	include "testcrtc.asm"


	print "REMAINING DEMO BYTES: ", {hex}(&10000-MAX_BUFFER_SIZE-$)

