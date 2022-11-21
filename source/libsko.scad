include <path_extrude.scad>;

M2=1.4;
M3=1.7;
M4=2.2;
// heated inserts
HI_M3=2.1;

module nut_M3() {
    cylinder(2,3.2,3.2,$fn=6);
}

module fillet(r, h) {
    translate([r / 2, r / 2, 0])
    difference() {
        cube([r + 0.01, r + 0.01, h], center = true);

        translate([r/2, r/2, 0])
            cylinder(r = r, h = h + 1, center = true);

    }
}

module roundcube(dim, r=2, $fn=32) {
    hull() {
        translate([r,r,0]) cylinder(dim[2], r, r);
        translate([dim[0]-r, r,0]) cylinder(dim[2], r, r);
        translate([r,dim[1]-r,0]) cylinder(dim[2], r, r);
        translate([dim[0]-r, dim[1]-r,0]) cylinder(dim[2], r, r);
    }
}

module Extrusion(length = 10, color = [0.2, 0.2, 0.2])
{
    color(color) render() difference()
    {
        linear_extrude(length)
        polygon([
            // corner
            [0,1], [1,0],
            // cut in
            [7, 0], [7, 1.6], [4, 1.6], [4, 3], [6.5, 5.5],
            [13.5, 5.5], [16, 3], [16, 1.6], [13, 1.6], [13, 0],
            // corner
            [19,0], [20,1],
            // cut in
            [20,7], [18.4, 7], [18.4, 4], [17, 4], [14.5, 6.5],
            [14.5, 13.5], [17, 16], [18.4, 16], [18.4, 13], [20, 13],
            // corner
            [20,19], [19,20],
            // cut in
            [13, 20], [13, 18.4], [16, 18.4], [16, 17], [13.5, 14.5],
            [6.5, 14.5], [4, 17], [4, 18.4], [7, 18.4], [7, 20],
            // corner
            [1,20], [0,19],
            // cut in
            [0, 13], [1.6, 13], [1.6, 16], [3, 16], [5.5, 13.5],
            [5.5, 6.5], [3, 4], [1.6, 4], [1.6, 7], [0, 7],
            // loop end
            [0,1]
        ]);
        translate([10, 10, -0.01]) cylinder(h=length + 0.02,d=5.5, $fn = 32);
    }
}

module square_hollow(dim, wall=0.5) {
    h = dim[0];
    w = dim[1];
    polygon(points=[
        [0,wall],
        [0,0],
        [h,0],
        [h,w],
        [0,w],
        [0,wall],
        [wall,wall],
        [wall,w-wall],
        [h-wall,w-wall],
        [h-wall,wall]
    ]);
}

module square_dome(size, dome=3, inner=false, wall=0.5) {
    w = size[1];
    h = size[0];
    p=2;
    if (inner) {
        polygon(points=[
            [wall,wall],
            [wall,w-wall+0.15],
            [h/p,w-wall+dome-wall/p+0.15],
            [h-wall,w-wall+0.15],
            [h-wall,wall]
        ]);
    } else {
        polygon(points=[
            [0,wall],
            [0,0],
            [h,0],
            [h,w],
            [h/p,w+dome],
            [0,w],
            [0,wall],
        ]);
    }
}

module PTFECoupling()
{
    render() difference() {
        union() {
            cylinder(r=5.8/2, h=4.5);
            translate([0, 0, 4.5]) cylinder(r=4, h=1.5);
            translate([0, 0, 6]) cylinder(r=11.45/2, h=10.2, $fn=6);
            translate([0, 0, 16.2]) cylinder(r=4, h=1.2);
            translate([0, 0, 17.4]) cylinder(r=2.5, h=1.2);
            translate([0, 0, 18.6]) cylinder(r=11.45/2, h=1.2);
        }
        translate([0, 0, -0.01]) cylinder(r=2.6/2, h=15);
        translate([0, 0, 10]) cylinder(r=4.3/2, h=10);
    }
}

module Fan(size=40,depth=10) {
    difference() {
        cube([size, depth, size]);
        translate([size/2,depth+1,size/2]) rotate([90,0,0]) cylinder(depth+2,size/2-1,size/2-1, $fn=128);
        translate([M3 + 1.5, depth+1, M3 + 1.5]) rotate([90,0,0]) cylinder($fn=32, r=M3, h=depth+2);
        translate([M3 + 1.5, depth+1, size - M3 - 1.5]) rotate([90,0,0]) cylinder($fn=32, r=M3, h=depth+2);
        translate([size -M3 -1.5, depth+1, M3 + 1.5]) rotate([90,0,0]) cylinder($fn=32, r=M3, h=depth+2);
        translate([size -M3 -1.5, depth+1, size - M3 - 1.5]) rotate([90,0,0]) cylinder($fn=32, r=M3, h=depth+2);
    }
    translate([size/2,depth,size/2]) rotate([90,0,0]) cylinder(depth,size/5,size/5, $fn=128);
    translate([size/2,depth/2,size/2]) for(r=[0:40:360]) rotate([0,r,0]) 
        translate([size/3,0,0]) rotate([60,0,0]) scale([1,0.5,1]) rotate([0,0,180]) cylinder(1,size/4,size/4, $fn=3);
}