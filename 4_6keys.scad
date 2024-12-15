// Generated by SolidPython 1.1.3 on 2024-12-14 22:49:13


union() {
	translate(v = [0.0000000000, 0.0000000000, 0]) {
		difference() {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
			union() {
				translate(v = [-10, -10, 0]) {
					cube(size = [20, 20, 10]);
				}
				translate(v = [-7, -7, -49]) {
					cube(size = [14, 14, 50]);
				}
				translate(v = [-10, -10, -51.5000000000]) {
					cube(size = [20, 20, 50]);
				}
			}
		}
	}
	translate(v = [0.0000000000, 19.0500000000, 0]) {
		difference() {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
			union() {
				translate(v = [-10, -10, 0]) {
					cube(size = [20, 20, 10]);
				}
				translate(v = [-7, -7, -49]) {
					cube(size = [14, 14, 50]);
				}
				translate(v = [-10, -10, -51.5000000000]) {
					cube(size = [20, 20, 50]);
				}
			}
		}
	}
	translate(v = [0.0000000000, 38.1000000000, 0]) {
		difference() {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
			union() {
				translate(v = [-10, -10, 0]) {
					cube(size = [20, 20, 10]);
				}
				translate(v = [-7, -7, -49]) {
					cube(size = [14, 14, 50]);
				}
				translate(v = [-10, -10, -51.5000000000]) {
					cube(size = [20, 20, 50]);
				}
			}
		}
	}
	translate(v = [19.0500000000, 0.0000000000, 0]) {
		difference() {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
			union() {
				translate(v = [-10, -10, 0]) {
					cube(size = [20, 20, 10]);
				}
				translate(v = [-7, -7, -49]) {
					cube(size = [14, 14, 50]);
				}
				translate(v = [-10, -10, -51.5000000000]) {
					cube(size = [20, 20, 50]);
				}
			}
		}
	}
	translate(v = [19.0500000000, 19.0500000000, 0]) {
		difference() {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
			union() {
				translate(v = [-10, -10, 0]) {
					cube(size = [20, 20, 10]);
				}
				translate(v = [-7, -7, -49]) {
					cube(size = [14, 14, 50]);
				}
				translate(v = [-10, -10, -51.5000000000]) {
					cube(size = [20, 20, 50]);
				}
			}
		}
	}
	translate(v = [19.0500000000, 38.1000000000, 0]) {
		difference() {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
			union() {
				translate(v = [-10, -10, 0]) {
					cube(size = [20, 20, 10]);
				}
				translate(v = [-7, -7, -49]) {
					cube(size = [14, 14, 50]);
				}
				translate(v = [-10, -10, -51.5000000000]) {
					cube(size = [20, 20, 50]);
				}
			}
		}
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from solid import *

# ケースになる部分
body = translate([-12, -12, -19])(
    cube([24, 24, 20])
)

# ケースからカットする部分
hole = union()(
    # スイッチの上側をカットする部分
    translate([-10, -10, 0])(
        cube([20, 20, 10])
    ),
    # スイッチの穴
    translate([-7, -7, -49])(
        cube([14, 14, 50])
    ),
    # スイッチプレートの下側
    translate([-10, -10, -51.5])(
        cube([20, 20, 50])
    ),
)

kbd = difference()(
    body,
    hole
)

position = [
    [19.05 * 0, 19.05 * 0],
    [19.05 * 0, 19.05 * 1],
    [19.05 * 0, 19.05 * 2],
    [19.05 * 1, 19.05 * 0],
    [19.05 * 1, 19.05 * 1],
    [19.05 * 1, 19.05 * 2],
]

kbd6u = union()(
    [translate([x, y, 0])(kbd) for x, y in position]
)

scad_render_to_file(kbd6u, '4_6keys.scad')
 
 
************************************************/
