include <libsko.scad>;
//include <SCxxUU-SCxxLUU_v05.scad>

/*
Extrusions
 2x 440
 2x 345 -> 140, 220
 2x 400
 4x 420
 
Rods
 2x 436
 4x 380
 
Lead Screws
2x 345
2x 400
1x 150
*/

RED = [1, 0.3, 0.3];

module Rod(length=10) color("lightgray") render() translate([4, 4, 0]) cylinder(h=length, d=8, $fn=32);

module cornercover() render()
{
    height = 4;
    difference()
    {
        rotate([0,0,-90]) hull()
        {
            cube([50,20,height]);
            cube([20,50,height]);
        }
        translate([25,-10,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([40,-10,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([10,-10,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([10,-25,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([10,-40,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
    }
}

module cornercover_foot() render()
{
    height = 4;
    cornercover();
    hull()
    {
        translate([0,-30, 0]) cube([height,30,15]);
        translate([0,-50, 0]) cube([height,40,height]);
    }
    hull()
    {
        translate([0, -4, 0]) cube([30,height,15]);
        translate([0, -4, 0]) cube([50,height,height]);
    }
}

module cornercover_z() render()
{
    height = 4;
    difference()
    {
        union()
        {
            difference()
            {
                rotate([0,0,-90]) hull()
                {
                    cube([50,20,height]);
                    cube([20,50,height]);
                }
                translate([25,-10,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
                translate([40,-10,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
                translate([10,-10,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
                translate([10,-25,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
                translate([10,-40,-0.01]) cylinder(r=M3, h=height+0.02, $fn=32);
            }

            if(1) hull()
            {
                translate([0, -height, -35]) cube([20,height,35]);
                translate([0, -height, -10+height]) cube([50,height,10]);
            }
            hull()
            {
                translate([0, -height, -35]) cube([height,height,35]);
                translate([0, -30, 0]) cube([height,10,1]);
            }
        }
        translate([9.75,0.01,-24]) rotate([90,0,0]) cylinder(r=4.1, h=height+0.02, $fn=32);
    }
}

module cornerbrace() render()
{
    height = 4;
    difference()
    {
        union()
        {
            cube([30,height,20]);
            cube([height,30,20]);
            hull()
            {
                cube([30,10,height]);
                cube([10,30,height]);
            }
            translate([0,0,16]) hull()
            {
                cube([30,10,height]);
                cube([10,30,height]);
            }
        }
        translate([10,height+0.01,10-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([20,height+0.01,10-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([-0.01,12,10-0.01]) rotate([0,90,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([-0.01,21,10-0.01]) rotate([0,90,0]) cylinder(r=M3, h=height+0.02, $fn=32);
    }
}

module cornerbrace_zb() render()
{
    height = 4;
    difference()
    {
        union()
        {
            hull()
            {
                cube([45,height,20]);
                cube([20,height,45]);
            }
            hull()
            {
                cube([height,30,20]);
                cube([height,height,45]);
            }
            hull()
            {
                cube([45,10,height]);
                cube([10,30,height]);
            }
        }
        translate([10,height+0.01,10-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([25,height+0.01,10-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([39,height+0.01,10-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([10,height+0.01,39-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([10,height+0.01,25-0.01]) rotate([90,0,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([-0.01,12,10-0.01]) rotate([0,90,0]) cylinder(r=M3, h=height+0.02, $fn=32);
        translate([-0.01,23,10-0.01]) rotate([0,90,0]) cylinder(r=M3, h=height+0.02, $fn=32);
    }
}

module MotorMountZ() render()
{
    if(1) difference()
    {
        translate([-10,-7,0]) cube([56,53,42]);
        // side screws
        translate([-5.16,0.1,-0.01]) cube([6.01,42.1,20.01]);
        translate([-12,10,10]) rotate([0,90,0]) cylinder(h=10, r=M3, $fn=32);
        translate([-12,30,10]) rotate([0,90,0]) cylinder(h=10, r=M3, $fn=32);
        hull(){
            translate([40,10,10]) rotate([0,90,0]) cylinder(h=10, r=4, $fn=32);
            translate([40,30,10]) rotate([0,90,0]) cylinder(h=10, r=4, $fn=32);
            translate([40,10,-10]) rotate([0,90,0]) cylinder(h=10, r=4, $fn=32);
            translate([40,30,-10]) rotate([0,90,0]) cylinder(h=10, r=4, $fn=32);
        }
        // back screw
        translate([-5.16,-4,-0.01]) cube([47.61,5,20.01]);
        translate([0,0,15]) rotate([90,0,0]) cylinder(h=10, r=M3, $fn=32);
        translate([35,0,10]) rotate([90,0,0]) cylinder(h=10, r=M3, $fn=32);
        translate([0,50,15]) rotate([90,0,0]) cylinder(h=10, r=4, $fn=32);
        translate([35,50,10]) rotate([90,0,0]) cylinder(h=10, r=4, $fn=32);
        // motor
        union()
        {
            translate([-0.05,-0.3,-6.3]) cube([42+0.6,42+0.6,45]);
            translate([21.25,21,36.99]) cylinder(h=10, d=22.5, $fn=64);
            translate([42/2 - 31/2  +0.25,42/2 - 31/2,36.99]) {
                translate([0,0,0]) cylinder(r=M3, h=10, $fn=32);
                translate([31,0,0]) cylinder(r=M3, h=10, $fn=32);
                translate([31,31,0]) cylinder(r=M3, h=10, $fn=32);
                translate([0,31,0]) cylinder(r=M3, h=10, $fn=32);
            }
        }
        // rod holder
        translate([-0.25,20.75,40]) rotate([0,0,0]) cylinder(r=4.2, h=10, $fn=32);
    }
    
    if (0) 
    {
        translate([0.25,-0.0,-9.5])difference()
        {
            union()
            {
                color("gray") cube([42,42,48]);
                color("lightgray") translate([21,21,48]) cylinder(d=22, h=2, $fn=64);
            }
        
            color("red") translate([42/2 - 31/2,42/2 - 31/2,48-4.5]) {
                translate([0,0,0]) cylinder(r=M3, h=5, $fn=32);
                translate([31,0,0]) cylinder(r=M3, h=5, $fn=32);
                translate([31,31,0]) cylinder(r=M3, h=5, $fn=32);
                translate([0,31,0]) cylinder(r=M3, h=5, $fn=32);
            }
        }
    }
}

module MotorMountY() render()
{
    difference()
    {
        union()
        {
            translate([-10,4.5,8.5]) cube([20,42,41]);
            translate([-10,-10,0]) cube([8,55.5,20]);
            hull()
            {
                translate([-10,45,0]) cube([8,2,20]);
                translate([-10,50,0]) cube([4,10,20]);
            }
            translate([-10,-10,0]) cube([25,4,20]);
            hull()
            {
                translate([-10,-10,0]) cube([25,8,4]);
                translate([-10,-10,0]) cube([8,20,4]);
            }
        }
        translate([7,-5,10]) rotate([90,0,0]) cylinder(h=10, r=M3, $fn=32);
        translate([-6,0,10]) rotate([0,90,0]) cylinder(h=15, r=3, $fn=32);
        translate([-15,0,10]) rotate([0,90,0]) cylinder(h=10, r=M3, $fn=32);
        translate([-6,53,10]) rotate([0,90,0]) cylinder(h=15, r=3, $fn=32);
        translate([-15,53,10]) rotate([0,90,0]) cylinder(h=10, r=M3, $fn=32);
        
        // motor
        translate([35.0,4.5,7.2]) rotate([0,-90,0]) union()
        {
            translate([-0.1,-0.1,-0.01]) cube([42.7,42.7,37.01]);
            translate([-8,20.75 - 7.5,-0.01]) cube([10,15,10.01]);
            translate([20.75,20.75,36.99]) cylinder(h=10, d=22.5, $fn=64);
            
            screwhole = 5-0.2;
            
            // br
            translate([5,5.5,36.99]) cylinder(h=screwhole, r=M3, $fn=32);
            translate([5,5.5,40.99]) cylinder(h=10, r=3, $fn=32);
            // tr
            translate([36,5.5,36.99]) cylinder(h=screwhole, r=M3, $fn=32);
            translate([36,5.5,40.99]) cylinder(h=10, r=3, $fn=32);
            // bl
            translate([5,36.5,36.99]) cylinder(h=screwhole, r=M3, $fn=32);
            translate([5,36.5,40.99]) cylinder(h=10, r=3, $fn=32);
            // tl
            translate([36,36.5,36.99]) cylinder(h=screwhole, r=M3, $fn=32);
            translate([36,36.5,40.99]) cylinder(h=10, r=3, $fn=32);
        }
    }
}

module BeltSpannerY() render()
{
    difference()
    {
        union()
        {
            translate([-5.2,0,0]) rotate([0,90,0]) cylinder(d=12, h=5, $fn=64);
            translate([-5.2,0,-6]) cube([5,30,12]);
            
            translate([10.2,0,0]) rotate([0,90,0]) cylinder(d=12, h=5, $fn=64);
            translate([10.2,0,-6]) cube([5,30,12]);
            
            translate([-5.2,29,-6]) cube([20.4,6,12]);
        }
        translate([5,40,0]) rotate([90,0,0]) cylinder(r=M3, h=20, $fn=64);
        translate([-5.5,0,0]) rotate([0,90,0]) cylinder(r=M3, h=21, $fn=64);
        translate([5,30.9,0]) rotate([90,0,0]) nut_M3();
    }
}

module BeltSpannerYMount() render()
{
    difference()
    {
        hull()
        {
            translate([-6,-14,-8]) cube([22,20,16]);
            translate([-20,-14,-8]) cube([50,20,4]);
        }
        translate([5,10,0]) rotate([90,0,0]) cylinder(r=M3, h=25, $fn=64);
        translate([-5.5,-24,-6.25]) cube([21,24,12.5]);
        
        translate([-12,-4,-4]) rotate([0,0,0]) cylinder(h=15, r=3, $fn=32);
        translate([-12,-4,-10]) rotate([0,0,0]) cylinder(h=12, r=M3, $fn=32);
        
        translate([22,-4,-4]) rotate([0,0,0]) cylinder(h=15, r=3, $fn=32);
        translate([22,-4,-10]) rotate([0,0,0]) cylinder(h=12, r=M3, $fn=32);
    }
}

module RodHolderY(back=false) render()
{
    difference()
    {
        union()
        {
            if (back)
                translate([0,10,0]) rotate([90,0,0]) cylinder(d=14, h=25, $fn=64);
            hull()
            {
                translate([0,20,0]) rotate([90,0,0]) cylinder(d=14, h=20, $fn=64);
                translate([-20,0,-12]) cube([40,20,4]);
            }
        }
        translate([0,5.1,0]) rotate([90,0,0]) cylinder(d=8.2, h=25, $fn=64);
        translate([12,10,-8]) cylinder(r=3, h=15, $fn=64);
        translate([12,10,-15]) cylinder(r=M3, h=15, $fn=64);
        translate([-12,10,-8]) cylinder(r=3, h=15, $fn=64);
        translate([-12,10,-15]) cylinder(r=M3, h=15, $fn=64);
    }
}

module EntstopMountY() render()
{
    difference()
    {
        union()
        {
            cube([20,4,20]);
            translate([0,-1,7.5]) cube([20,4,5]);
            translate([0,0,16]) cube([20,27,4]);
            translate([0,17,20]) cube([20,10,4]);
        }
        translate([10,4.5,10]) rotate([90,0,0]) cylinder(r=M3, h=6, $fn=16);
        translate([14.6,21,10]) cylinder(r=0.75, h=20, $fn=16);
        translate([5.2,21,10]) cylinder(r=0.75, h=20, $fn=16);
    }
}

module EntstopMountZ() render()
{
    difference()
    {
        union()
        {
            cube([20,4,20]);
            translate([8,-1,0]) cube([4,5,22]);
            translate([-7,0,15]) cube([27,9,7]);
        }
        translate([10,4.5,10]) rotate([90,0,0]) cylinder(r=M3, h=6, $fn=16);
        translate([7.4,15,17.75]) rotate([90,0,0]) cylinder(r=0.75, h=20, $fn=16);
        translate([-2,15,17.75]) rotate([90,0,0]) cylinder(r=0.75, h=20, $fn=16);
    }
}

module BeltClampY() render()
{
    difference()
    {
        hull()
        {
            translate([-6,0,0]) cylinder(h=4.5, d=9.4, $fn=64);
            translate([6,0,0]) cylinder(h=4.5, d=9.4, $fn=64);
        }
        translate([-6,0,-1]) cylinder(h=6, r=M4, $fn=64);
        translate([6,0,-1]) cylinder(h=6, r=M4, $fn=64);
        translate([-3,-5,3.4]) cube([6,10,3]);
        translate([-3,4,3.4]) rotate([0,90,0]) cylinder(h=6, d=1, $fn=64);
        translate([-3,2,3.4]) rotate([0,90,0]) cylinder(h=6, d=1, $fn=64);
        translate([-3,0,3.4]) rotate([0,90,0]) cylinder(h=6, d=1, $fn=64);
        translate([-3,-2,3.4]) rotate([0,90,0]) cylinder(h=6, d=1, $fn=64);
        translate([-3,-4,3.4]) rotate([0,90,0]) cylinder(h=6, d=1, $fn=64);
    }
}

module BedChainMount() //render()
{
    difference()
    {
        union()
        {
            translate([0,0,0]) cube([45,35,3]);
            translate([45,0,0]) cube([3,35,18]);
            translate([45,0,18]) cube([25,35,3]);
        }
        translate([0,0,-1]) {
            translate([7.2,7.8,0]) cylinder(h=10, r=M4, $fn=64);
            translate([32.2,7.8,0]) cylinder(h=10, r=M4, $fn=64);
            translate([32.2,25.8,0]) cylinder(h=10, r=M4, $fn=64);
            translate([7.2,25.8,0]) cylinder(h=10, r=M4, $fn=64);
            translate([54,20,18]) 
            {
                cylinder(h=10, r=M3, $fn=64);
                translate([10,0,0]) cylinder(h=10, r=M3, $fn=64);
                translate([5,8,0]) cylinder(h=10, r=M3, $fn=64);
            }
        }
    }
}

module CornerExtrusionCover() render()
{
    translate([-1,-1,0])
    {
        translate([0,0,-1]) cube([51,1,22]);
        translate([21,1,7 + 0.2]) cube([30,3,6 - 0.4]);
        translate([0,0,-1]) cube([1,51,22]);
        translate([1,0,7 + 0.2]) cube([2,51,6 - 0.4]);
        translate([2.75,0,6 + 0.2]) cube([1,51,8 - 0.4]);
        difference()
        {
            union()
            {
                translate([10 + 1,6,10]) rotate([90,0,0]) cylinder(d=5.2, h=5, $fn=32);
                translate([10 + 1,6,10]) scale([1.15,1,1]) sphere(d=5.2, $fn=64);
            }
            translate([10 + 0.5,2,7]) cube([1,10,6]);
        }
    }
}

// z frame
module GantryFrame()
{
    translate([-10, 0, -20]) Extrusion(420);
    translate([410, 0, -20]) Extrusion(420);
    translate([10, 0, 400]) rotate([0,90,0]) Extrusion(400);
    translate([10, 0, 0]) rotate([0,90,0]) Extrusion(400);
    
    translate([-4.25, 44, 20]) Rod(380);
    translate([416.25, 44, 20]) Rod(380);
    
    color(RED)
    {
        translate([-10, 0, 400]) rotate([90,0,0]) cornercover();
        translate([430, 0, 400]) rotate([90,90,0]) cornercover();
        translate([430, 24, 400]) rotate([90,0,0]) mirror([1,0,0]) cornercover_z();
        translate([-10, 24, 400]) rotate([90,0,0]) cornercover_z();
        
        // Z frame to bed corners
        translate([-10, 0, -20]) mirror([0,1,0]) cornerbrace_zb();
        translate([430, 0, -20]) rotate([0,0,-180]) cornerbrace_zb();
        
        translate([0, 27, -19.75]) MotorMountZ();
        translate([420, 27, -19.75]) mirror([1,0,0]) MotorMountZ();
        
        translate([410, 20, 50]) EntstopMountZ();
        
        translate([-10, 0, 400]) rotate([-90,0,0]) CornerExtrusionCover();
        translate([430, 20, 400]) rotate([-90,0,180]) CornerExtrusionCover();
    }
}

module BedFrame()
{
    translate([-10, -20, 0]) rotate([0,90,0]) Extrusion(440);
    translate([-10, -420, 0]) rotate([0,90,0]) Extrusion(440);
    
    translate([-30, 0, -20]) rotate([90,0,0]) Extrusion(420);
    translate([430, 0, -20]) rotate([90,0,0]) Extrusion(420);
    
    // cut from 345
    translate([200, -260, -20]) rotate([90,0,0]) Extrusion(140);
    // cut from 345
    translate([200, -20, -20]) rotate([90,0,0]) Extrusion(220);
    
    // bed rods
    translate([120.5, -15, 8]) rotate([90,0,0]) Rod(380);
    translate([291.75, -15, 8]) rotate([90,0,0]) Rod(380);
    
    color(RED)
    {
        // center cross
        translate([220, -240, -20]) cornerbrace();
        translate([200, -240, -20]) rotate([0,0,90]) cornerbrace();
        translate([200, -260, -20]) rotate([0,0,180]) cornerbrace();
        translate([220, -260, -20]) rotate([0,0,270]) cornerbrace();
        
        // front cross braces
        translate([220, -20, -20]) mirror([0,1,0]) cornerbrace();
        translate([200, -20, -20]) mirror([1,1,0]) cornerbrace();
        // back cross braces
        translate([200, -400, -20]) mirror([1,0,0]) cornerbrace();
        
        // bed corner covers
        translate([-30, 0, 0]) cornercover();
        translate([-30, 0, -20]) rotate([180,0,-90]) cornercover_foot();
        
        translate([-30, -420, 4]) rotate([180,0,0]) cornercover();
        translate([-30, -420, -20]) rotate([180,0,0]) cornercover_foot();
        
        translate([450, -420, 0]) rotate([0,0,180]) cornercover();
        translate([450, -420, -20]) rotate([0,180,-90]) cornercover_foot();
        
        translate([450, 0, 4]) rotate([0,180,0]) cornercover();
        translate([450, 0, -20]) rotate([0,180,0]) cornercover_foot();
        
        translate([230, -390, -20]) MotorMountY();
        
        // bed rods
        translate([124.5, -20, 12]) RodHolderY();
        translate([295.75, -20, 12]) RodHolderY();
        translate([124.5, -400, 12]) rotate([0,0,180]) RodHolderY(true);
        translate([295.75, -400, 12]) rotate([0,0,180]) RodHolderY(true);
        
        translate([205, -52, 8]) BeltSpannerY();
        translate([205, -6, 8]) BeltSpannerYMount();
        
        translate([131, -400, -20]) EntstopMountY();
        
        translate([210, -146.25, 10]) BeltClampY();
        translate([210, -146.25 + 18, 10]) BeltClampY();
        
        translate([276, -118, 24.75]) BedChainMount();
        
        translate([-30, -420, -20]) CornerExtrusionCover();
        translate([450, -420, 0]) rotate([0,180,0]) CornerExtrusionCover();
        translate([450, 0, -20]) rotate([0,0,180]) CornerExtrusionCover();
        translate([-30, 0, 0]) rotate([180,0,0]) CornerExtrusionCover();
    }
        
}

// case
module LackCase()
{
    color("white")
    {
        translate([0,0,0]) cube([550,550,50]);
        translate([0,0,800]) cube([550,550,50]);
        
        translate([0,0,0]) cube([50,50,400*2]);
        translate([500,0,0]) cube([50,50,400*2]);
        translate([500,500,0]) cube([50,50,400*2]);
        translate([0,500,0]) cube([50,50,400*2]);
    }
    
    color("white", 0.2)
    {
        translate([50,5,50]) cube([450,5,400*2 - 50]);
        translate([5,50,50]) cube([5,450,400*2 - 50]);
        translate([550-10,50,50]) cube([5,450,400*2 - 50]);
    }
}


STL = 0;

if (STL)
{
    if (1) color(RED)
    {
        for (n=[1:1:4])
            translate([(n-1)*60,0,0]) cornercover_foot();
        for (n=[1:1:6])
            translate([(n-1)*60,65,0]) cornercover();
        for (n=[1:1:7])
            translate([(n-1)*40,155,0]) rotate([90,0,0]) cornerbrace();
        translate([0, 165, 0]) rotate([-90,0,0]) mirror([0,1,0]) cornerbrace_zb();
        translate([55, 210, 0]) rotate([90,0,0]) cornerbrace_zb();
    
        translate([0, 125, 4]) rotate([0,180,0]) mirror([1,0,0]) cornercover_z();
        translate([110, 125, 4]) rotate([0,180,0]) cornercover_z();
    
        translate([125, 85, 6]) rotate([90,0,0]) rotate([-90,0,0]) BeltSpannerY();
        translate([170, 100, 6]) rotate([-90,0,0]) BeltSpannerYMount();
        
        translate([170, 170, 20]) rotate([0,90,0]) EntstopMountY();
    
        translate([160,250,20]) rotate([-90,0,0]) RodHolderY();
        translate([50 + 160,250,20]) rotate([-90,0,0]) RodHolderY();
        translate([100 + 160,250,20]) rotate([-90,0,0]) RodHolderY(true);
        translate([150 + 160,250,20]) rotate([-90,0,0]) RodHolderY(true);
        
        translate([160, 170, 10]) rotate([0,-90,0]) MotorMountY();
        translate([190, 210, 22]) rotate([0,180,0]) EntstopMountZ();
    
        translate([220, 90, 0]) BeltClampY();
        translate([220, 90 + 18, 0]) BeltClampY();
        
        translate([46, 270, 42]) rotate([180,0,0]) mirror([1,0,0]) MotorMountZ();
        translate([80, 270, 42]) rotate([180,0,0]) MotorMountZ();
    
        for (n=[1:1:6])
            translate([175 + 25*n, 175, 1]) rotate([90,0,90]) CornerExtrusionCover();
        
        translate([250,110,0]) rotate([90,0,0]) BedChainMount();
    }
}
else
{
    if (1) translate([0, -50, 0]) GantryFrame();
    if (1) translate([0, 210, 0]) BedFrame();


    // debug
    if (0) translate([210, -45.0, -31.5]) render() import("Anet_gantry.stl");
    if (0) translate([210, -45, -26.75]) render() import("Anet_bed.stl");
        
    if (0) translate([-60,-270,-80]) LackCase();
}

