	include once "../macros.asm"
	include once "inner://ga.asm"

	DEBUG_MODE = false

	

	; C1: 0 1 2 7 => can modify screen 0x0000 0x4000 0x8000 by fuck with 0x38
	; C2: 4 5 6 7 => can modify nothing
	; C3: 0 3 2 7 => can modify 0x0000, 0xc000 but in space 0x000 0x8000 but fuck with 0x38
	
	bankset 0
	; nothing to add now

	/*
	// deactivated: it is automatically done by the demo
	org 0x0000 : incbin "CPC_A01.scr"
	org 0x4000 : incbin "CPC_A02.scr"
	org 0x8000 : incbin "CPC_A03.scr"
	org 0xc000 : incbin "CPC_A04.scr"
	*/
	bankset 1

	include "depth_extra_page.asm"


	save "C4.4100", 0x100, 0x4000-0x100
	save "C5.4000", 0x4000, 0x4000
	save "C6.4000", 0x8000, 0x4000 - REMAINING_BYTES
	save "C7.4000", 0xc000, last_byte-0xc000+1