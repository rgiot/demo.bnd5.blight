;;;
; Memory AREA 0x0000-0x3fff
; Only available in &c2 memory configuration
;
; Contains:
; - The music
; - The spiral curve
	
	

	include "music/secret_rooms_akg_playerconfig.asm"
	PLY_CFG_UseEffect_PitchUp = 1
    PLY_CFG_UseEffect_PitchDown = 1

music_data
	include "music/secret_rooms_akg.asm"
	include "music/PlayerAkg.asm"


c2_music_init
	ld hl, music_data : xor a
	call PLY_AKG_Init
	ret

c2_play_music
	call PLY_AKG_Play
	ret


