
USE_LOGO_SPLITS = false
USE_LOGO_BACKROUND_RASTER = true


assert USE_LOGO_SPLITS ^ USE_LOGO_BACKROUND_RASTER, "You must choose between logo splits or logo background raster"


EQUALIZERS_HEIGHT equ 10
EQUALIZERS_PADDING equ 2
ENABLE_DOTS_EFFECT equ false

	org 0x100
	include "depth_music.asm"
	include "depth_spiral.asm"
	include "depth_infinite_sprite_data.asm"
	include "depth_crunched_background.asm"
	include "depth_logo_data.asm"
	include "depth_transitions.asm"

	assert $<0xc000, "There is too much data. It eats the space of the demo effect"

	REMAINING_BYTES  =(&c000-$)
	print "REMAINING DATA BYTES: ", {hex}REMAINING_BYTES



	org 0xc000
	SNASET GA_RAMCFG, 0xC2

	run $ ; TODO add a warning in basm when run is uwsed with bankset 1 and without SNASET CA_RAMCFG
	ld bc, 0x7fc2 : out (c), c 	; linker was in &c1
	call depth_init
	jp depth_run


	

	include "depth_logo_splits.asm"
	if USE_LOGO_BACKROUND_RASTER
		include "depth_logo_rasters.asm"
	endif
	include "depth_equalizers.asm"
	include "depth_demo_main.asm"

	last_byte equ $-1