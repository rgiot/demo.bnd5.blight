equalizers_handling
		ld a, 8 : call lectpsg
        call .get_volume_routine_address
        ld hl, split_border_in_pixels_zone.select_volumea + 1
        call .update_volume_table_routines
        
		ld a, 9 : call lectpsg
        call .get_volume_routine_address
        ld hl, split_border_in_pixels_zone.select_volumeb + 1
        call .update_volume_table_routines
		
		ld a, 10 : call lectpsg
        call .get_volume_routine_address
        ld hl, split_border_in_pixels_zone.select_volumec + 1
        call .update_volume_table_routines

    ret

.update_volume_table_routines
    ld b, EQUALIZERS_HEIGHT
.loop
        ld (hl), e : inc hl
        ld (hl), d : inc hl
        inc hl
    djnz .loop
    ret

.get_volume_routine_address
        ld hl, split_border_in_pixels_zone.volume_table_routines
        and 15
		add a
        ld d, 0 : ld e, a
        add hl, de
        ld e, (hl) : inc hl
        ld d, (hl)
    ret



;;
; input : A channel to read
; output: A volume
lectpsg    
	LD    B,#F4
    OUT    (C),A
    LD    BC,#F6C0
    OUT    (C),C

 ; CPC PLUS compatibility
	xor a
	out (c),a
;
    LD    BC,#F792
    OUT    (C),C
    LD    BC,#F640
    OUT    (C),C
    LD    B,#F4
    IN    A,(C)

; A contains the volume
    LD    BC,#F782
    OUT    (C),C
	dec b
	ld c,0
	out (c),c
;
any_ret
    RET


