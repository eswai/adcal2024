// Generated by SolidPython 1.1.3 on 2024-12-14 22:49:18


difference() {
	union() {
		translate(v = [0.0000000000, 0.0000000000, 0]) {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
		}
		translate(v = [0.0000000000, 19.0500000000, 0]) {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
		}
		translate(v = [0.0000000000, 38.1000000000, 0]) {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
		}
		translate(v = [19.0500000000, 0.0000000000, 0]) {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
		}
		translate(v = [19.0500000000, 19.0500000000, 0]) {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
		}
		translate(v = [19.0500000000, 38.1000000000, 0]) {
			translate(v = [-12, -12, -19]) {
				cube(size = [24, 24, 20]);
			}
		}
	}
	union() {
		translate(v = [0.0000000000, 0.0000000000, 0]) {
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
		translate(v = [0.0000000000, 19.0500000000, 0]) {
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
		translate(v = [0.0000000000, 38.1000000000, 0]) {
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
		translate(v = [19.0500000000, 0.0000000000, 0]) {
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
		translate(v = [19.0500000000, 19.0500000000, 0]) {
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
		translate(v = [19.0500000000, 38.1000000000, 0]) {
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

position = [
    [19.05 * 0, 19.05 * 0],
    [19.05 * 0, 19.05 * 1],
    [19.05 * 0, 19.05 * 2],
    [19.05 * 1, 19.05 * 0],
    [19.05 * 1, 19.05 * 1],
    [19.05 * 1, 19.05 * 2],
]

body6 = union()(
    [translate([x, y, 0])(body) for x, y in position]
)

hole6 = union()(
    [translate([x, y, 0])(hole) for x, y in position]
)

kbd = difference()(
  body6,
  hole6
)

scad_render_to_file(kbd, '5_6keys-2.scad')
 
 
************************************************/
