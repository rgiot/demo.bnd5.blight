c2_spiral_data
	include "unlimited_spiral.asm"

spiral_nb_points = spiral_x_coords.stop - spiral_x_coords.start
c2_spiral_z_data
	repeat spiral_nb_points, i, 0

		delta = 10-int({i}*10/spiral_nb_points)
		db delta*4*2

	endr
