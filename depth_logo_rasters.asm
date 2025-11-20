RASTER_LOGO_WAIT equ 0
RASTER_LOGO_TABLE_HEIGHT equ 30


rasters_under_logo

	if RASTER_LOGO_WAIT > 0
		ld a, RASTER_LOGO_WAIT
	.wait_loop
			defs 64 - (1 + 2)
		dec a
		jr nz, .wait_loop
	else
		defs 9-2-4-2 + 30 + 10 + 10 + 2 -2
	endif


	ld bc, 0x7f54
	ld hl, (.restore_palette)
	ld de, 0x10*256 + 2
	exx


	xor a : ex af, af'
	ld a, RASTER_LOGO_TABLE_HEIGHT
	ld hl, .table
	ld de, 0x10*256 + 2
	ld b, 0x7f
.height_loop
		ld c, (hl) : inc hl
		
		ex af, af'
		cp c
		jp z, .no_raster
		ex af, af'

		out (c), e : out (c), c
		inc e : out (c), e : out (c), c
		out (c), d : out (c), c
		dec e

		defs 64 - (3+2+4*4+1+2 + 1 + 4 +4 + 1) - 1 - 1 - 3 - 1
.check_end_loop
	dec a
	jr nz, .height_loop


	nop : nop : nop
	ld a, 0x54
	out (c), d : out (c), a

	ld hl, 0x5454
.restore_palette equ $-2
	out (c), e : out (c), h
	inc e : out (c), e : out (c), l

	defs 64*2 + 40 + 18 + 1 - 1 - 3 - 2 - 1 - 1 - 1
	ret

.no_raster
	ex af, af'

	exx
		out (c), d : out (c), c
		out (c), e : out (c), h
		inc e : out (c), e : out (c), l : dec e
	exx

	defs 64 - (1+1+3+1+1+2) - (2+4+4) - 8 - 30 + 12
	jp .check_end_loop

.table
	db GA_COL_03
	db GA_COL_07
	db GA_COL_16
	db GA_COL_07
	db GA_COL_03
	db GA_COL_00

	defs 8, 0

	; green
	; db GA_COL_12
	; db GA_COL_21
	; db GA_COL_25
	; db GA_COL_26
	; db GA_COL_25
	; db GA_COL_21
	; db GA_COL_12
	; db GA_COL_00

	db GA_COL_10
	db GA_COL_19
	db GA_COL_25
	db GA_COL_26
	db GA_COL_25
	db GA_COL_19
	db GA_COL_10
	db GA_COL_00

	if false
		defs 12, 0

		db GA_COL_01
		db GA_COL_02
		db GA_COL_11
		db GA_COL_20
		db GA_COL_23
		db GA_COL_26
		db GA_COL_23
		db GA_COL_20
		db GA_COL_11
		db GA_COL_02
		db GA_COL_01
		db GA_COL_00
	endif

.table_count equ $ - .table
	repeat  RASTER_LOGO_TABLE_HEIGHT - .table_count
		db 0
	endr

