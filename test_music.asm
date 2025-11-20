

    org 0x1000
    run $

    ld hl, 0xc9fb : ld (0x38), hl
    ei

    call c2_music_init
vsync
    ld b, 0xf5
    in a, (c)
    rra
    jr nc, vsync


    halt
    halt

    call c2_play_music
    jp vsync


    include "depth_music.asm"