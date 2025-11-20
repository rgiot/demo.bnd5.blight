;;
; All the content of this file is ONLY availbe in C2 configuration
; any other configuration will break the code
; Contains
; - ALL the variants of the ball display routine of the spiral





;;
; The pearl display routines are not called directly
; They are copy-pasted in a bettermemory space that allows a display in any banks visualisable
	macro list_ball, zoom
		dw ball_{zoom}_0_asm
		dw ball_{zoom}_1_asm
		dw ball_{zoom}_2_asm
		dw ball_{zoom}_3_asm
	endm


INFINITE_SPRITE_MAX_SIZE_ROUTINE = 0
	macro include_one_ball_file, fname
	@start
		include {fname}
	@len = $-@start

	INFINITE_SPRITE_MAX_SIZE_ROUTINE = max(INFINITE_SPRITE_MAX_SIZE_ROUTINE, @len)
	endm


	macro include_ball, zoom
		include_one_ball_file "ball_{zoom}_0.asm"
		include_one_ball_file "ball_{zoom}_1.asm"
		include_one_ball_file "ball_{zoom}_2.asm"
		include_one_ball_file "ball_{zoom}_3.asm"
	endm


c2_balls_routine_indirection_table
pearl_table
	list_ball 0
	list_ball 1
	list_ball 2
	list_ball 3
	list_ball 4
	list_ball 5
	list_ball 6
	list_ball 7
	list_ball 8
	list_ball 9
	list_ball 10

c2_balls_routine
universal_bc26_r1_32 = c1c3_universal_bc26_r1_32 ; Ensure version of balls are not used
	include_ball 0
	include_ball 1
	include_ball 2
	include_ball 3
	include_ball 4
	include_ball 5
	include_ball 6
	include_ball 7
	include_ball 8
	include_ball 9
	include_ball 10
