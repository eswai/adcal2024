from solid import *
from solid.utils import extrude_along_path
from euclid3 import Point2, Point3, Vector3

KUNIT = 19.05
KUNIT2 = 19.1

pos = [
  ([19.05 * 0, 19.05 * 3,  0  ], [-7, -8, 0], [1, 1, 2, 1,    5, 5, 1, 1]),
  ([19.05 * 1, 19.05 * 3,  2  ], [-7, -4, 0], [1, 1, 2, 1,    2, 5, 1, 1]),
  ([19.05 * 2, 19.05 * 3,  2.7], [-7,  0, 0], [1, 1, 2, 1,    2, 5, 1, 1]),
  ([19.05 * 3, 19.05 * 3,  1.7], [-7,  5, 0], [1, 1, 2, 1,    2, 5, 1, 1]),
  ([19.05 * 4, 19.05 * 3, -0.9], [-7, 10, 0], [1, 1, 2, 1,    5, 5, 1, 1]),

  ([19.05 * 0, 19.05 * 2,  0   + 1.2], [0, -8, 0], [1, 1, 2, 1,    5, 2, 1, 1]),
  ([19.05 * 1, 19.05 * 2,  2   + 1.2], [0, -4, 0], [1, 1, 2, 1,    2, 2, 1, 1]),
  ([19.05 * 2, 19.05 * 2,  2.7 + 1.2], [0,  0, 0], [1, 1, 2, 1,    2, 2, 1, 1]),
  ([19.05 * 3, 19.05 * 2,  1.7 + 1.2], [0,  5, 0], [1, 1, 2, 1,    2, 2, 1, 1]),
  ([19.05 * 4, 19.05 * 2, -0.9 + 1.2], [0, 10, 0], [1, 1, 2, 1,    5, 2, 1, 1]),

  ([19.05 * 0, 19.05 * 1,  0  ], [7, -8, 0], [1, 1, 2, 1,    5, 5, 1, 1]),
  ([19.05 * 1, 19.05 * 1,  2  ], [7, -4, 0], [1, 1, 2, 1,    2, 3, 1, 1]),
  ([19.05 * 2, 19.05 * 1,  2.7], [7,  0, 0], [1, 1, 2, 1,    2, 3, 1, 1]),
  ([19.05 * 3, 19.05 * 1,  1.7], [7,  5, 0], [1, 1, 2, 1,    2, 3, 1, 1]),
  ([19.05 * 4, 19.05 * 1, -0.9], [7, 10, 0], [1, 1, 2, 1,    5, 3, 1, 1]),

  ([19.05 * 0 -3, 19.05 * 0 -1.5,  0  -7], [20, -30, -3], [1, 1, 2, 1,  1.5, 3, 1, 1]),
  ([19.05 * 1 -2, 19.05 * 0 -1.0,  2  -5], [20, -25, -2], [1, 1, 2, 1,  1.5, 2, 1, 1]),
  ([19.05 * 2 -1, 19.05 * 0 -0.5,  2.7-5], [15, -15,  0], [1, 1, 2, 1,  1.5, 2, 1, 1]),
  ([19.05 * 3   , 19.05 * 0 -0.5,  1.7-5], [15,   5,  0], [1, 1, 2, 1,  2.0, 3, 1, 1]),
  ([19.05 * 4   , 19.05 * 0 -0.5, -0.9-5], [15,  10,  0], [1, 1, 2, 1,  2.0, 3, 1, 1]),
]

def switch(s):
    ux, uy, lx, ly, usx, usy, lsx, lsy = s

    return union()(
        # switch hole
        translate([-7, -7, -7])(cube([14, 14, 8])),
        # above switch plate
        linear_extrude(height = 25, scale=[usx, usy])(
            translate([- KUNIT2 / 2 * ux, - KUNIT2 / 2 * uy])(square([KUNIT2 * ux, KUNIT2 * uy]))
        ),
        # pocket for snap fit
        translate([-15 / 2, -9 / 2, -3])(cube([15, 9, 2])),
        # below switch plate
        # translate([0, 0, -22])(
            # linear_extrude(height = 20, scale=[lsx, lsy])(
                translate([- KUNIT2 / 2 * lx, - KUNIT2 / 2 * ly])(square([KUNIT2 * lx, KUNIT2 * ly]))
                # translate([- 14 / 2, - 14 / 2])(square([14, 14]))
            # )
        # ),
    )

bsw = union()(
    translate([0, 0, -10])(
        sphere(d=33, segments=100)
    )
)

base = rotate([0, 3, 0])(
    union()(
        [translate(xyz)(rotate(rot)(bsw)) for xyz, rot, scale in pos],
        # 底に穴が空かないように
        translate([0, 0, -20])(cube([KUNIT2 * 4, KUNIT2 * 3, 40]))
    )
)

swarray = rotate([0, 3, 0])(
    union()(
        [translate(xyz)(rotate(rot)(switch(scale))) for xyz, rot, scale in pos]
    )
)

kb = difference()(
    base,
    swarray,
    translate([-30, -30, -120])(
        cube([200, 200, 100])
    ),
    translate([0, 0, -21])(linear_extrude(2)(circle(r=4.5))),
    translate([KUNIT2*4, 0, -21])(linear_extrude(2)(circle(r=4.5))),
    translate([KUNIT2*4, KUNIT2*3, -21])(linear_extrude(2)(circle(r=4.5))),
    translate([0, KUNIT2*3, -21])(linear_extrude(2)(circle(r=4.5))),
    # 突起を消す
    translate([28, -10, 0])(cube([40, 20, 10])),
)

# 左手
kb = difference()(
    mirror([1, 0, 0])(kb),
    # translate([-5, 20, -19])(rotate([0, 180, 0])(linear_extrude(3)(text("eswai", size=18, segments=100)))),
)

scad_render_to_file(kb, 'tenkey_sphere.scad')
