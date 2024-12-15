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

# スイッチの位置 x, y, z と角度[度] rx, ry
position = [
    [19.05 * 0, 19.05 * 0,  1, -5, 5],
    [19.05 * 0, 19.05 * 1,  0,  0, 5],
    [19.05 * 0, 19.05 * 2,  1,  5, 5],
    [19.05 * 1, 19.05 * 0,  0, -5, 0],
    [19.05 * 1, 19.05 * 1, -1,  0, 0],
    [19.05 * 1, 19.05 * 2,  0,  5, 0],
]

# ケースを合体
case6 = union()(
    [
        translate([x, y, z])(
            rotate([rx, ry, 0])(body)
        ) for x, y, z, rx, ry in position
    ]
)

# カット部分を合体
hole6 = union()(
    [
        translate([x, y, z])(
            rotate([rx, ry, 0])(hole)
        ) for x, y, z, rx, ry in position
    ]
)

# ケースの底を平らにカットするための立方体
bottom = translate([-20, -20, -29])(
  cube([100, 100, 20])
)

# ケースからカット部分を引く
kbd = difference()(
  case6,
  hole6,
  bottom
)

scad_render_to_file(kbd, '7_6keys-comp.scad')
