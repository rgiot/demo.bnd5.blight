;;
; Krusty/Benediction
; August 2025
; Provide some utility macros that help to link demos.
; Should be reusable in other projects as soon as they are simple enough to use a single cruncher to avoid name clashes


; TODO: allow the user to specify the buffer addresses to still earn some bytes
;       current version CANNOT fit a 4k production because of this aspect
; TODO: some uncruncher are able to handle some parameters. Handle that cleanly

	ifdef SELECTED_CRUNCHER
		fail "You need to specify SELECTED_CRUNCHER after including this file"
	endif

CRUNCHER_COUNT set 0
CRUNCHER_APLIB next CRUNCHER_COUNT
CRUNCHER_EXOMIZER next CRUNCHER_COUNT
CRUNCHER_LZ4 next CRUNCHER_COUNT
CRUNCHER_LZ48 next CRUNCHER_COUNT
CRUNCHER_LZ49 next CRUNCHER_COUNT
CRUNCHER_LZSA1 next CRUNCHER_COUNT
CRUNCHER_LZSA2 next CRUNCHER_COUNT
CRUNCHER_SHRINKLER next CRUNCHER_COUNT
CRUNCHER_UPKR next CRUNCHER_COUNT
CRUNCHER_ZX0 next CRUNCHER_COUNT
CRUNCHER_ZX7 next CRUNCHER_COUNT

	
	macro LOAD_N_CRUNCH_WITH cruncher, label, fname
		@content = load({fname})
		{label}
		.start
			{cruncher}
				db @content
			LZCLOSE
		.next
		.last = $-1
		.length = $-.start
		.uncrunched_length = list_len(@content)

		print "CRUNCHED ", {fname}, " FROM ", .uncrunched_length, " BYTES TO ", .length, " BYTES IN [", {hex}.start,"-",{hex}($-1),"]"
	endm


	macro UNCRUNCH_PRELUDE, from, to
		assert {to} >= {from}.next | {to} < {from}.start
		print "Uncrunch from ", {hex}{from}, " to ", {hex}{to}
	endm


	macro UNCRUNCH_ANY, from, to

		ifdef {from}.start
			assert {from} == {from}.start
			UNCRUNCH_PRELUDE({from}, {to})
		endif

		ld hl, {from}
		ld de, {to}
		call uncrunch
	endm
	

	macro UNCRUNCH_LZ4, from, to
		UNCRUNCH_PRELUDE({from}, {to})


		ld hl, {from}.start
		ld bc, {from}.length
		ld de, {to}
		call uncrunch
	endm


	macro UNCRUNCH_UPKR, from, to
		UNCRUNCH_PRELUDE({from}, {to})

		ld ix, {from}.start
		ld de, {to} : exx
		call uncrunch
	endm

	macro UNCRUNCH_SHRINKLER, from, to
		UNCRUNCH_PRELUDE({from}, {to})

		ld ix, {from}.start
		ld de, {to}
		call uncrunch
	endm

	macro INSTALL_EXOMIZER
		include once "inner://deexo.asm"
	uncrunch
		Mizoumizeur()
		ret
	endm

	macro INSTALL_APLIB
			include once "inner://unaplib_fast.asm"
	uncrunch
		ApUnpack()
		ret
	endm

	macro INSTALL_UPKR
		uncrunch
		include once "inner://uncrunch/upkr.asm"
		org upkr.probs_e ; we need to skip some space for the upkr probe
	endm

	macro INSTALL_LZ4
		uncrunch
		include once "inner://lz4_docent.asm"
	endm

	macro INSTALL_LZ48
		uncrunch
		include once "inner://lz48decrunch.asm"
	endm

	macro INSTALL_LZ49
		uncrunch
		include once "inner://lz49decrunch.asm"
	endm

	macro INSTALL_LZSA1
		uncrunch
		include once "inner://unlzsa1_fast.asm"
		DecompressLZSA1(void)
	endm

	macro INSTALL_LZSA2
		uncrunch
		include once "inner://unlzsa2_fast.asm"
		DecompressLZSA2(void)
	endm

	macro INSTALL_SHRINKLER
		include once "inner://deshrink.asm"
		uncrunch equ shrinkler_decrunch
		org probs + &800
	endm

	macro INSTALL_ZX0
		uncrunch
		include once "inner://dzx0_fast.asm"
		DecompressZX0()
	endm

	macro INSTALL_ZX7
		uncrunch
		include once "inner://uncrunch/dzx7_turbo.asm"
	endm

	;;
	; Load a data file and crunch it with the selected cruncher.
	; The file is crunched with the selected cruncher at the label `label`
	; Sub labels .start is synonyme, .next is the byte after last crunched byte, .length is the crunched size
	macro LOAD_N_CRUNCH label, fname
		switch SELECTED_CRUNCHER
			case CRUNCHER_EXOMIZER:
				LOAD_N_CRUNCH_WITH(LZEXO, {label}, {fname})
				break
			case CRUNCHER_APLIB
				LOAD_N_CRUNCH_WITH(LZAPU, {label}, {fname})
				break
			case CRUNCHER_UPKR
				LOAD_N_CRUNCH_WITH(LZUPKR, {label}, {fname})
				break
			case CRUNCHER_LZ4
				LOAD_N_CRUNCH_WITH(LZ4, {label}, {fname})
				break
			case CRUNCHER_LZ48
				LOAD_N_CRUNCH_WITH(LZ48, {label}, {fname})
				break
			case CRUNCHER_LZ49
				LOAD_N_CRUNCH_WITH(LZ49, {label}, {fname})
				break
			case CRUNCHER_LZSA1
				LOAD_N_CRUNCH_WITH(LZSA1, {label}, {fname})
				break
			case CRUNCHER_LZSA2
				LOAD_N_CRUNCH_WITH(LZSA2, {label}, {fname})
				break
			case CRUNCHER_SHRINKLER
				LOAD_N_CRUNCH_WITH(LZSHRINKLER, {label}, {fname})
				break
			case CRUNCHER_ZX0
				LOAD_N_CRUNCH_WITH(LZX0, {label}, {fname})
				break
			case CRUNCHER_ZX7
				LOAD_N_CRUNCH_WITH(LZX7, {label}, {fname})
				break
			default:
				fail "Unhandled case: ", SELECTED_CRUNCHER
		ends
	endm

	macro UNCRUNCH from, to
		switch SELECTED_CRUNCHER
			case CRUNCHER_EXOMIZER:
			case CRUNCHER_APLIB:
			case CRUNCHER_LZ48:
			case CRUNCHER_LZ49:
			case CRUNCHER_LZSA1:
			case CRUNCHER_LZSA2:
			case CRUNCHER_ZX0:
			case CRUNCHER_ZX7:
				UNCRUNCH_ANY({from}, {to})
				break
			case CRUNCHER_UPKR:
				UNCRUNCH_UPKR({from}, {to})
				break
			case CRUNCHER_LZ4:
				UNCRUNCH_LZ4({from}, {to})
				break
			case CRUNCHER_SHRINKLER
				UNCRUNCH_SHRINKLER({from}, {to})
				break
			default:
				fail "Unhandled case: ", SELECTED_CRUNCHER
		ends
	endm

	macro INSTALL_UNCRUNCHER
		switch SELECTED_CRUNCHER
			case CRUNCHER_EXOMIZER:
				INSTALL_EXOMIZER()
				break
			case CRUNCHER_APLIB:
				INSTALL_APLIB()
				break
			case CRUNCHER_UPKR:
				INSTALL_UPKR()
				break
			case CRUNCHER_LZ4
				INSTALL_LZ4()
				break
			case CRUNCHER_LZ48
				INSTALL_LZ48()
				break
			case CRUNCHER_LZ49
				INSTALL_LZ49()
				break
			case CRUNCHER_LZSA1
				INSTALL_LZSA1()
				break
			case CRUNCHER_LZSA2
				INSTALL_LZSA2()
				break
			case CRUNCHER_SHRINKLER
				INSTALL_SHRINKLER()
				break
			case CRUNCHER_ZX0
				INSTALL_ZX0()
				break
			case CRUNCHER_ZX7
				INSTALL_ZX7()
				break
			default:
				fail "Unhandled case: ", SELECTED_CRUNCHER
			ends
	endm