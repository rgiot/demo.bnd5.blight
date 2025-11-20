	include "linker_common.asm"
	
	SELECTED_CRUNCHER equ CRUNCHER_ZX0
	
	org 0x200
	run $



uncrunch_parts
	ld sp, &c000
	di

	ld bc, 0xbc00 + 1 : out (c), c
	ld bc, 0xbd00 + 0 : out (c), c

	ld bc, 0x7f10 : out (c), c
	ld bc, 0x7f54 : out (c), c

	ld bc, 0x7fc1 : out (c), c
	UNCRUNCH(C7_4000, 0xc000) : assert C7_4000< 0xc000 : assert C7_4000.last < 0xc000

	ld bc, 0x7fc6 : out (c), c
	UNCRUNCH(C6_4000, 0x4000) : assert C6_4000.last < 0x4000

	ld bc, 0x7fc5 : out (c), c
	UNCRUNCH(C5_4000, 0x4000) : assert C5_4000.last < 0x4000

	ld bc, 0x7fc0 : out (c), c
	ld hl, C4_4100 : ld de, data : ld bc, C4_4100.length : ldir
	ld hl, 0xc9fb : ld (0x38), hl
	ld bc, 0x7fc4 : out (c), c
	ld (0x38 + 0x4000), hl
	UNCRUNCH(data, 0x4100) : assert data + C4_4100.length < 0x4100

launch_part
	ld bc, 0x7fc1 : out (c), c
	jp &c000

	INSTALL_UNCRUNCHER()

data
	LOAD_N_CRUNCH(C6_4000, "C6.4000") ; safe
	LOAD_N_CRUNCH(C5_4000, "C5.4000") ; safe
	LOAD_N_CRUNCH(C4_4100, "C4.4100") ; unsafe / need tà be moved
	LOAD_N_CRUNCH(C7_4000, "C7.4000") ; safe


	SAVE "BLIGHT.001", , , AMSDOS