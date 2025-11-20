        ifndef __DS_HT_delay1
__DS_HT_delay1 equ 26
        endif


	macro DS_SECURE_WAIT_VSYNC
	ld b, 0xf5
@wait_novsync
	in a, (c)
	rra
	jr c, @wait_novsync

@wait_vsync
	in a, (c)
	rra
	jr nc, @wait_vsync
endm


macro DS_WAIT_VSYNC
	ld b, 0xf5
@wait_vsync
	in a, (c)
	rra
	jr nc, @wait_vsync
endm
    
    MACRO DS_WAIT_MICROSEG duration
@k EQU {duration} - 1
		LD   B,@k / 4                      ; (2 = 1 that we subtracted and 1 that is missing from the DJNZ)
		DJNZ $                              ; (4 * [N - 1] + 3 = 4 * N - 1)
		DEFS @k % 4                        ; (1 * [4 * N - 1] % 4)
	ENDM


MACRO DS_WRITE_CRTC register, value
        LD   BC, &bc00 + {register}
        OUT  (C),C
        LD   BC, &bd00 + {value}
        OUT  (C),C
ENDM


	MACRO DS_CRTC_HORIZONTAL_TRANSITION_ONLY from, to
@delta EQU ({to}) - ({from})
		DS_WAIT_MICROSEG(__DS_HT_delay1)

		; START OF CRTC TRANSITION, WRITE TEMP R0 ---------------------------------+
		DS_WRITE_CRTC(0, {eval}63 - @delta)  	; 14 NOPs
		DS_WAIT_MICROSEG(64 - 14 - 14)
		xor a                    		; 1 NOP  XXX initial code of Pulko was tagged 1 NOP but using ld a, 0
		DS_WRITE_CRTC(2, {to})         	; 14 NOPs
		DEC B                    		; 13 remaining NOPs of CRTC write
		OUT (C),A
		LD BC, &bd00+63
		; END OF CRTC TRANSITION, RESTORE R0 exactly 64us later -------------------+
		OUT (C), C
	ENDM


    MACRO DS_CRTC_VERTICAL_TRANSITION_ONLY_NO_MUSIC, from, to
		DS_SECURE_WAIT_VSYNC()

		; Here, C4=({from})

		DS_WRITE_CRTC(4, 38 + ({from}) - ({to}))

		if ({to}) > ({from})
			halt
			halt
			DS_WRITE_CRTC(7, ({to}))
		else
			DS_WRITE_CRTC(7, ({to}))
			HALT
			HALT
		endif

		DS_WAIT_VSYNC()
		DS_WRITE_CRTC(4, 38)
	ENDM