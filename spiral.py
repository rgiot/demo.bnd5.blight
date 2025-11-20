"""
Curve generator for a spiral
"""

import matplotlib.pyplot as plt
import numpy as np


def normalize(val):
	max_ = np.max(val)
	min_ = np.min(val)
	return (val - min_) / (max_-min_)

BOBS_WIDTH=32
CURVE_LENGTH=50*10*10

SCREEN_HEIGHT_DELTA = 10
SCREEN_WIDTH=64*4 - BOBS_WIDTH
SCREEN_HEIGHT= 26*8

A=1.0
NB_SPIRALS = 13

MAX_ANGLE = NB_SPIRALS*2*np.pi

theta = np.linspace(0, MAX_ANGLE, CURVE_LENGTH)
r = A*theta
x = r*np.cos(theta)
y = r*np.sin(theta)

x = normalize(x)*SCREEN_WIDTH
y = normalize(y)*SCREEN_HEIGHT + SCREEN_HEIGHT_DELTA

plt.figure()
plt.plot(x,y)
plt.scatter(x,y)


with open("unlimited_spiral.asm", "w") as f:

	f.writelines(
		(l + "\n" for l in [
			f"CURVE_LENGTH={CURVE_LENGTH}",
			"spiral_x_coords",
			".start",
			" db " + ",".join("&%x"%int(a) for a in x),
			".stop",
			"spiral_y_coords",
			".start",
			" db " + ",".join("&%x"%int(a) for a in y),
			".stop"
		])
	)



plt.show()
