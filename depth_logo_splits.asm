;;
; The aim of this file is to handle the display of the logo by
; enlarging it with split rasters in the borders , and 
; by using split border in the pixel part to hide possibly overwritten bytes
; by the infinite sprites routine

LOGO_SPLIT_RASTER_BACKGROUND_INK equ GA_COL_0
LOGO_SPLIT_RASTER_FOREGROUND_INK equ GA_RED
;LOGO_SPLIT_BORDER_FOREGROUND_INK equ GA_COL_15
LOGO_SPLIT_BORDER_FOREGROUND_INK equ GA_COL_08


LOGO_SPLIT_PALETTE = [GA_COL_03,GA_COL_03,GA_COL_07,GA_COL_07,GA_COL_07,GA_COL_07,GA_COL_08,GA_COL_08,GA_COL_08,GA_COL_08,GA_COL_17,GA_COL_17,GA_COL_17,GA_COL_17,GA_COL_25,GA_COL_25]
	; GA_COL_03,
	; GA_COL_07, 
	; GA_COL_07, 
	; GA_COL_07,
	; GA_COL_07,
	; GA_COL_08,
	; GA_COL_08, 
	; GA_COL_08,
	; GA_COL_08,
	; GA_COL_17, 
	; GA_COL_17, 
	; GA_COL_17, 
	; GA_COL_17,
	; GA_COL_25,
	; GA_COL_25]

LOGO_SPLIT_RASTER_MIN_WAIT_TIME_WITH_CALL = duration(call 0) + duration(ret)
LOGO_SPLIT_RASTER_MAX_WAIT_TIME_WITH_CALL = 64 - LOGO_SPLIT_RASTER_MIN_WAIT_TIME_WITH_CALL

;;
; Wait by injecting nops or jumping
macro LOGO_WAIT amount
	assert {amount} >= 0
	assert {amount} <= 64
	if {amount} < LOGO_SPLIT_RASTER_MIN_WAIT_TIME_WITH_CALL
		if {amount} != 0
			defs {amount}, 0
		endif
	else

		call wait_code.ret - ({amount} - LOGO_SPLIT_RASTER_MIN_WAIT_TIME_WITH_CALL)
	endif

	_logo_routine_count_ += {amount}
endm

;;
; to be call to encode the beginning of a line
macro LOGO_SPLIT_RASTER_START_LINE
	_logo_routine_count_ = duration(call 0) + duration(ret)
endm

;;
; to be called to encode the end of a line of the split raster effect
macro LOGO_SPLIT_RASTER_WAIT_EOL
	print "Raster routine count", _logo_routine_count_, " wait ", (64 - _logo_routine_count_)
	; The 64 nops include
	; - the call to the routine
	; - the true routine code
	; - the call to the wait
	; - the ret
	; TODO use jp to wait
	LOGO_WAIT( {eval}(64 - _logo_routine_count_))
	undef _logo_routine_count_
	ret
endm

;;
; to be called to encode the end of a line of the split raster effect
macro LOGO_SPLIT_BORDER_CLEANUP_AND_WAIT_EOL
	; ensure split border is off
	LOGO_BACKGROUND()


	; ensure color of border is correct
	ticker start inner_duration
		exx  ; we switch to the color backup
		out (c), d ; we change border color to black
	ticker stop
	_logo_routine_count_ += inner_duration
	undef inner_duration

	print "Border routine count", _logo_routine_count_, " wait ", (64 - _logo_routine_count_)
	; The 64 nops include
	; - the call to the routine
	; - the true routine code
	; - the call to the wait
	; - the ret
	; TODO use jp to wait
	LOGO_WAIT( {eval}(64 - _logo_routine_count_))
	undef _logo_routine_count_
	ret
endm

;;
; request a foreground display
; - for the zone with split-raster in border it changes the ink to the selected foreground ink
; - for the zone with split-border in the pixels, it activates border
macro LOGO_FOREGROUND
	out (c), e
	_logo_routine_count_ += duration(out (c), e)
endm

;;
; request a background display
; - for the zone with split-raster in border it changes the ink to the standard border ink
; - for the zone with split-border in the pixels, it activates pixels display
macro LOGO_BACKGROUND
	out (c), d
	_logo_routine_count_ += duration(out (c), d)
endm


;;
; Make the necessary to have border inside the pixel of a different color that the border outside of the pixel aea
macro LOGO_SPLIT_BORDER_START_ROUTINE
	BREAKPOINT condition="B<>0x7f"
	BREAKPOINT condition="D<>0x54"
	ticker start inner_duration
		out (c), e ; we change border color to something else than black
		exx  ; we switch the the split border registers
	ticker stop
	_logo_routine_count_ = duration(call 0) + duration(ret) +  inner_duration
	undef inner_duration

	; TODO Add a breakpoint for a specific C0 value
endm


	if USE_LOGO_SPLITS

;;
; Handle the drawing of blocks inside the left and right border to enlarge the logo
split_rasters_in_border_zone

	ld bc, 0x7f10 : out (c), c
	ld de, LOGO_SPLIT_RASTER_BACKGROUND_INK*256 + LOGO_SPLIT_RASTER_FOREGROUND_INK



	; call plenty of routines. The number of calls correspond to the height of the split raster in border zone
	; each routine must takes 64 nops - duration(call xxxx)  - duration(ret) EXACTLY
	; this must be enforced by the assembler to be sure there is no bug. Look at example routines
	;
	; the only operations authorized in routines are:
	; - LOGO_WAIT(X) => does nothing, the beamer moves of X*2 chars
	; - LOGO_FOREGROUND()=> set border in background ink after the beamer moved of 8 chars
	; - LOGO_BACKGROUND() => set border in foreground ink after the beamer moved of 8 chars
	; BREAKPOINT => the emulator will stop here
	; This will be EXACTLY the same principle with the split border area
	; in the best work every routins stats/stops in background, but it s not mandatory for art reason

.call_table_start

	repeat 5
		call .routine1
	endr

	repeat 5
		call .routine2
	endr

	repeat 10
		call .routine_nothing
	endr


		repeat 5
		call .routine1
	endr

	repeat 5
		call .routine2
	endr

	repeat 10
		call .routine_nothing
	endr

.call_table_nb_entries = ($-.call_table_start)/3

	print "THERE ARE ", .call_table_nb_entries, " SPLIT RASTER LINES"



	ret


.routine1
	LOGO_SPLIT_RASTER_START_LINE()
		LOGO_FOREGROUND()
		LOGO_BACKGROUND()
	LOGO_SPLIT_RASTER_WAIT_EOL()

.routine2
	LOGO_SPLIT_RASTER_START_LINE()
		LOGO_FOREGROUND()
		LOGO_BACKGROUND()
		LOGO_FOREGROUND()
		LOGO_WAIT(35)
		LOGO_BACKGROUND()
	LOGO_SPLIT_RASTER_WAIT_EOL()

.routine_nothing
	LOGO_SPLIT_RASTER_START_LINE()
		; no code as the routine does nothing
	LOGO_SPLIT_RASTER_WAIT_EOL()


	endif

;; TODO call these routines
split_border_setup_crtc0
	ld bc, 0xbc00+8 : out (c), c : inc b
	ld de, %00110000 + %00000000*256
	ret
split_border_setup_crtc1
	ld bc, 0xbc00+ 6 : out (c), c : inc b
	ld de, 32*256 + 0
	ret



;;
; Handle the drawing of split border blocks inside displayed logo area
split_border_in_pixels_zone
	ld a, 0
.activated equ $-1
	or a : ret z


	call split_border_setup_crtc0
.crtc_routine equ $-2

	exx
	ld bc, 0x7f10 : out (c) ,c ; TODO remove that as it must already be the case
	ld de, BORDER_INK*256 + LOGO_SPLIT_BORDER_FOREGROUND_INK


	; call plenty of routines. The number of calls correspond to the height of the split raster in border zone
	; each routine must takes 64 nops - duration(call xxxx)  - duration(ret) EXACTLY
	; this must be enforced by the assembler to be sure there is no bug. Look at example routines
	;
	; the only operations authorized in routines are:
	; - LOGO_WAIT(X) => does nothing, the beamer moves of X*2 chars
	; - LOGO_FOREGROUND() => set border in foreground ink after the beamer moved of 8 chars
	; - LOGO_BACKGROUND() => set border in background ink after the beamer moved of 8 chars
	; BREAKPOINT => the emulator will stop here

.call_table_start


	.select_volumea
	repeat EQUALIZERS_HEIGHT
		call .volume0
	endr

	repeat EQUALIZERS_PADDING
		call .routine_nothing
	endr

	.select_volumeb
	repeat EQUALIZERS_HEIGHT
		call .volume7
	endr

	repeat EQUALIZERS_PADDING
		call .routine_nothing
	endr

	.select_volumec
	repeat EQUALIZERS_HEIGHT
		call .volume15
	endr


.call_table_nb_entries = ($-.call_table_start)/3

	print "THERE ARE ", .call_table_nb_entries, " SPLIT BORDER LINES"

	ld a, 0
.wait_before_big_logo equ $ -1
	dec a
	ld (.wait_before_big_logo), a
	or a
	call z, activate_big_sprite
	ret

	ret


	.volume_table_routines:
	repeat 16, volume, 0
		dw .volume{{volume}}
	endr
	

	repeat 15, volume, 1
	.volume{{volume}}
		ld e, list_get(LOGO_SPLIT_PALETTE, {volume})
		LOGO_SPLIT_BORDER_START_ROUTINE()
		_logo_routine_count_ += duration(ld e, 0)
		;LOGO_WAIT(int((16-{volume})/2))
		LOGO_WAIT(23 - {volume})
		LOGO_FOREGROUND()
		LOGO_WAIT({volume})
		;LOGO_FOREGROUND()
		;LOGO_WAIT(32-2*{volume})
		LOGO_SPLIT_BORDER_CLEANUP_AND_WAIT_EOL()
	endr


	.volume0
	.routine_nothing
		LOGO_SPLIT_BORDER_START_ROUTINE() 
		LOGO_SPLIT_BORDER_CLEANUP_AND_WAIT_EOL()


/*
	; the second bloc CANNOT be smaller
.routine1
	LOGO_SPLIT_BORDER_START_ROUTINE() 
	LOGO_FOREGROUND()
	LOGO_WAIT(2)
	LOGO_BACKGROUND()
	LOGO_WAIT(2)
	LOGO_FOREGROUND()
	LOGO_SPLIT_BORDER_CLEANUP_AND_WAIT_EOL() ; there is an automatic logo background call so no need to do it


	; we do not really respect timing and close border AFTER pixels. This allows to draw a bit outside
.routine2
	LOGO_SPLIT_BORDER_START_ROUTINE() 
	LOGO_WAIT(20)
	LOGO_FOREGROUND()
	LOGO_WAIT(3)
	LOGO_SPLIT_BORDER_CLEANUP_AND_WAIT_EOL() ; there is an automatic logo background call so no need to do it

.routine_nothing
	LOGO_SPLIT_BORDER_START_ROUTINE() 
	LOGO_SPLIT_BORDER_CLEANUP_AND_WAIT_EOL()

endif
*/

	;;
; An area where we do jump the routines to wait
wait_code
	defs LOGO_SPLIT_RASTER_MAX_WAIT_TIME_WITH_CALL, 0
.ret
	ret
