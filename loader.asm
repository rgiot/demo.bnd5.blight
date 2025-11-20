    include "inner://dzx0_fast.asm"
    include "inner://firmware/scrpack.asm"

	LOCOMOTIVE install_image
10 call {install_image}
20 RUN"BLIGHT.001
30 ' 6 layers in your face
31 ' GFX: Macdeath
32 ' SFX: Giherem / Conversion of secret rooms
33 ' Z80: Krusty
34 '  Released at Benediction coding party 5
    endlocomotive

install_image

    ld a, 1 : call SCR_SET_MODE

    ld a, 0 : ld bc, 0*256 + 0 : call SCR_SET_INK : ld bc, 0 : call SCR_SET_BORDER
    ld a, 1 : ld bc, 0 : call SCR_SET_INK
    ld a, 2 : ld bc, 0 : call SCR_SET_INK
    ld a, 3 : ld bc, 0 : call SCR_SET_INK

    halt : halt : halt : halt : halt : halt

    di
        push ix
            ld hl, screen_start
            ld de, 0xc000
            call decompress
        pop ix
    ei

    ld a, 1 : ld bc, 26*256 + 26 : call SCR_SET_INK
    ld a, 2 : ld bc, 5*256 + 5 : call SCR_SET_INK
    ld a, 3 : ld bc, 14*256 + 14 : call SCR_SET_INK


    ret


decompress
    DecompressZX0()
    

screen_start
    inczx0 "generique.scr"
screen_stop