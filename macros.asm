	macro WRITE_CRTC reg, val
		ld bc, 0xbc00 + {reg} : out (c), c
		ld bc, 0xbd00 + {val} : out (c), c
	endm


	macro BORDER val
		if DEBUG_MODE
			ld bc, 0x7f10:out(c), c : ld bc, 0x7f00 + {val} : out (c), c
		else
			ld bc, 0x7f10:out(c), c : ld bc, 0x7f10 : out (c), c
		endif
	endm