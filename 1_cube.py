from solid import *

# ケースになる部分
body = translate([-12, -12, -19])(
    cube([24, 24, 20])
)

scad_render_to_file(body, '1_cube.scad')
