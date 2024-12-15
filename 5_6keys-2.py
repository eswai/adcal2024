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
