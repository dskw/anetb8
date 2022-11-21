include <libsko.scad>;

RED = [0.5, 0.5, 0.5];


/*

~~~~~~~~~~ TODO ~~~~~~~~~~
 * RPi power cable

*/

// case
module LackCase()
{
    color("white") render()
    {
        translate([0,0,0]) cube([550,550,50]);
        translate([0,0,800]) cube([550,550,50]);
        
        translate([0,0,0]) cube([50,50,400*2]);
        translate([500,0,0]) cube([50,50,400*2]);
        translate([500,500,0]) cube([50,50,400*2]);
        translate([0,500,0]) cube([50,50,400*2]);
    }
    
    color("white", 0.2) render()
    {
        translate([50,5,50]) cube([450,5,400*2 - 50]);
        translate([5,50,50]) cube([5,450,400*2 - 50]);
        translate([550-10,50,50]) cube([5,450,400*2 - 50]);
        translate([50,550-10,50]) cube([450,5,400*2 - 50]);
    }
}

module Powersupply() color("silver") render()
{
    width = 114;
    length = 215;
    height = 50;
    difference()
    {
        cube([width,length,height]);
        translate([1.7,-1,7.5 + 1]) cube([width - 1.7*2,18.5 + 1,42.5]);
        translate([38,165,height-3]) cylinder(d=60, h=5, $fn=64);
        translate([-2,32,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
        translate([-2,182,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
        translate([width-2,32,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
        translate([width-2,182,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
        translate([width-2,32,36]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
        translate([width-2,182,36]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
    }
    translate([18,0,5]) cube([90,15.5,15.5]);
    translate([50,0,14]) rotate([90,0,0]) cylinder(d=6.6, h=30, $fn=32);
    translate([90,0,14]) rotate([90,0,0]) cylinder(d=6.6, h=30, $fn=32);
}

module MountPi(r=M2, h=10, $fn=32) translate([4.87+M2, 3.7+M2, 0])
{
    cylinder(r=r, h=h);
    translate([58.5,0,0]) cylinder(r=r, h=h);
    translate([58.5,49,0]) cylinder(r=r, h=h);
    translate([0,49,0]) cylinder(r=r, h=h);
}
module RaspberryPi() color("green")
{
    import("Raspberry_Pi_3_Light_Version.STL");
}


module Display() color("darkred") render()
{
    import("Full_Graphic_Smart_Controller.STL");
}


module Fan() color([244/255, 224/255, 198/255]) render()
{
    difference()
    {
        roundcube([92,92,15], 5);
        translate([2.6+M4,2.6+M4,-1]) cylinder(r=M4, h=20, $fn=32);
        translate([92 - 2.6 - M4,2.6+M4,-1]) cylinder(r=M4, h=20, $fn=32);
        translate([92 - 2.6 - M4,92 - 2.6 - M4,-1]) cylinder(r=M4, h=20, $fn=32);
        translate([2.6 + M4,92 - 2.6 - M4,-1]) cylinder(r=M4, h=20, $fn=32);
        translate([92/2,92/2,-1]) cylinder(d=89, h=20, $fn=128);
    }
}


module MountBoard(r=M3, h=5, $fn=32) translate([1.3+M3, 3.6+M3, 0]) 
{
    cylinder(r=r, h=h);
    translate([94,72,0]) cylinder(r=r, h=h);
    translate([0,72,0]) cylinder(r=r, h=h);
    translate([94,0,0]) cylinder(r=r, h=h);
}
module Board() color("white")
{
    import("gt2560.stl");
    difference()
    {
        translate([0, 0, -1]) cube([109,81, 1]);
        translate([0, 0, -2]) MountBoard(h=6);
    }
}


module MountRelay(r=M3, h=5, $fn=32) translate([1.2+M3, 0.75+M3, 0]) 
{
    cylinder(r=r, h=h);
    translate([20.5,28,0]) cylinder(r=r, h=h);
    translate([20.5,0,0]) cylinder(r=r, h=h);
    translate([0,28,0]) cylinder(r=r, h=h);
}
module Relay() color("lightblue") render()
{
    difference()
    {
        cube([26.5, 33.5, 4]);
        translate([0, 0, -1]) MountRelay(h=6);
    }
    translate([5.5,2,0]) cube([15.5, 26.5, 19]);
    translate([5.5,33.5,5]) cube([1, 4.5, 1]);
    translate([7.75,33.5,5]) cube([1, 4.5, 1]);
    translate([10,33.5,5]) cube([1, 4.5, 1]);
    translate([5.5,32.5,4]) cube([5.5, 1, 2]);
}


module USBHolder() color(RED) render()
{
    difference()
    {
        $fn=32;
        union()
        {
            translate([0,0,0]) cube([17.5,9,11]);
            hull()
            {
                translate([-4,3,7.5]) rotate([90,0,0]) cylinder(r=3.5, h=3);
                translate([21.5,3,7.5]) rotate([90,0,0]) cylinder(r=3.5, h=3);
            }
        }
        translate([2,-1,3]) cube([13.5,11,10]);
        translate([-4,9.5,7.5]) rotate([90,0,0]) cylinder(r=M3, h=12);
        translate([21.5,9.5,7.5]) rotate([90,0,0]) cylinder(r=M3, h=12);
    }
    translate([2,0,11]) rotate([-90,0,0]) linear_extrude(9) polygon([[0,0],[0,2],[1,2],[0,0]]);
    translate([15.5,0,11]) mirror([1,0,0]) rotate([-90,0,0]) linear_extrude(9) polygon([[0,0],[0,2],[1,2],[0,0]]);
}


module CaseTop() color(RED) render() 
{
    difference()
    {
        union()
        {
            // top
            translate([-0.2,75.723,113.621]) cube([114.4,170.28,3]);

            // raspberrypi mount
            if (1) translate([-0.0, 82.8, 110.3]) difference()
            {
                MountPi(r=3.5, h=3.5);
                translate([0, 0, -1]) MountPi(r=0.75);
            }
        }
        
        // fan mount
        translate([10, 145, 105])
        {
            translate([2.6+M4,2.6+M4,-1]) cylinder(r=M4, h=20, $fn=32);
            translate([92 - 2.6 - M4,2.6+M4,-1]) cylinder(r=M4, h=20, $fn=32);
            translate([92 - 2.6 - M4,92 - 2.6 - M4,-1]) cylinder(r=M4, h=20, $fn=32);
            translate([2.6 + M4,92 - 2.6 - M4,-1]) cylinder(r=M4, h=20, $fn=32);
            translate([92/2,92/2,-1]) cylinder(d=80, h=20, $fn=128);
        }
    }
    for(y=[76:75:240])
    {
        translate([0,y,116]) rotate([0,90,0]) difference()
        {
            roundcube([10,7,4]);
            translate([6,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
        }
        translate([110,y,116]) rotate([0,90,0]) difference()
        {
            roundcube([10,7,4]);
            translate([6,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
        }
    }
}


module CaseMain() color(RED) render()
{
    difference()
    {
        union()
        {
            translate([-3.2,0,0]) cube([3,249,65]);
            translate([114.2,0,0]) cube([3,249,65]);
            translate([-3.2,-3,0]) cube([120.4,3,65]);
            // top
            if (1)
            {
                // top
                translate([-3.2,70.723,113.62]) cube([120.4,5,3]);
                // sides
                translate([-3.2,70.915,65]) cube([3,178.085,51.62]);
                translate([114.2,70.915,65]) cube([3,178.085,51.62]);
            }
            // display mount
            if(1) translate([-3.2,-3,65]) rotate([-55,0,0]) 
            {
                difference()
                {
                    cube([120.4,3,90]);
                    translate([20.2,-1,25.25]) cube([79,10,51.5]);
                    translate([96,5,7.2]) rotate([90,0,0]) cylinder(d=8, h=10, $fn=64);
                }
                translate([10.7,7.25,10.525]) difference()
                {
                    union()
                    {
                        translate([93,0,8]) rotate([90,0,0]) cylinder(d=7, h=5, $fn=64);
                        translate([5.05,0,8]) rotate([90,0,0]) cylinder(d=7, h=5, $fn=64);
                        translate([5.05,0,73]) rotate([90,0,0]) cylinder(d=7, h=5, $fn=64);
                        translate([93,0,73]) rotate([90,0,0]) cylinder(d=7, h=5, $fn=64);
                    }
                    translate([0,1,0]) {
                        translate([93,0,8]) rotate([90,0,0]) cylinder(d=HI_M3*2, h=6, $fn=64);
                        translate([5.05,0,8]) rotate([90,0,0]) cylinder(d=HI_M3*2, h=6, $fn=64);
                        translate([5.05,0,73]) rotate([90,0,0]) cylinder(d=HI_M3*2, h=6, $fn=64);
                        translate([93,0,73]) rotate([90,0,0]) cylinder(d=HI_M3*2, h=6, $fn=64);
                    }
                }
                cube([3,45,90]);
                translate([117.4,0,0]) cube([3,45,90]);
            }
        }
        
        // powersupply mount
        translate([114, 215, 0]) rotate([0,0,180])
        {
            width = 114;
            height = 50;
            translate([-4,32,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
            translate([-4,182,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
            translate([width-1,32,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
            translate([width-1,182,11.5]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
            translate([width-1,32,36]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
            translate([width-1,182,36]) rotate([0,90,0]) cylinder(r=M4, h=5, $fn=32);
        }
        
        // inner plate mount
        translate([0.2, 0, 50.5])
        {
            translate([-5,43,10]) rotate([0,90,0])
            {
                translate([4,3.5,-1]) cylinder(r=M3, h=6, $fn=32);
            }
            translate([0,105,10]) rotate([0,90,0])
            {
                translate([4,3.5,-4]) cylinder(r=M3, h=6, $fn=32);
            }
            translate([0,198,10]) rotate([0,90,0])
            {
                translate([4,3.5,-4]) cylinder(r=M3, h=6, $fn=32);
            }
            translate([109.6+6,0,0])
            {
                translate([0,105,10]) rotate([0,90,0])
                {
                    translate([4,3.5,-4]) cylinder(r=M3, h=6, $fn=32);
                }
                translate([0,198,10]) rotate([0,90,0])
                {
                    translate([4,3.5,-4]) cylinder(r=M3, h=6, $fn=32);
                }
            }
        }
        // back mount
        translate([-0.2,238,20]) rotate([0,90,0])
        {
            translate([3.5,3.5,-4]) cylinder(r=M3, h=6, $fn=32);
        }
        translate([-0.2,238,100]) rotate([0,90,0])
        {
            translate([3.5,3.5,-4]) cylinder(r=M3, h=6, $fn=32);
        }
        translate([110.2,238,20]) rotate([0,90,0])
        {
            translate([3.5,3.5,3]) cylinder(r=M3, h=6, $fn=32);
        }
        translate([110.2,238,100]) rotate([0,90,0])
        {
            translate([3.5,3.5,3]) cylinder(r=M3, h=6, $fn=32);
        }
        // top mount
        for(y=[76:75:240])
        {
            translate([-5,y,116]) rotate([0,90,0]) 
            {
                translate([6,3.5,-1]) cylinder(r=M3, h=6, $fn=32);
            }
            translate([115,y,116]) rotate([0,90,0])
            {
                translate([6,3.5,-1]) cylinder(r=M3, h=6, $fn=32);
            }
        }
    }
}

module CaseInner() color(RED) render()
{
    translate([0, 0, 50.5])
    {
        difference()
        {
            union()
            {
                translate([0,85,0]) cube([114, 160.8, 2]);
                translate([0,40,0]) cube([45, 50, 2]);
                // relay mount
                translate([5,80,1]) rotate([0,0,-90]) MountRelay(r=3.5, h=3.3, $fn=64);
                // board mount
                translate([5,195,1]) rotate([0,0,-90]) MountBoard(r=3.5, h=3.3, $fn=64);
            }
            translate([16,240,-5]) roundcube([7,7,10],1);
            translate([45,243,-5]) roundcube([5,5,10],1);
            translate([30,243,-5]) roundcube([5,5,10],1);
            translate([0,0,-1])
            {
                // relay holes
                translate([5,80,0]) rotate([0,0,-90]) MountRelay(r=HI_M3, h=6, $fn=64);
                // board holes
                translate([5,195,0]) rotate([0,0,-90]) MountBoard(r=HI_M3, h=6, $fn=64);                
            }
            translate([-0.5,62.5,-1]) cube([5, 9, 4]);
            // zip ties
            translate([5,85,-1]) {cube([1.5, 4, 4]); translate([10,0,0]) cube([1.5, 4, 4]); }
            translate([5,155,-1]) {cube([1.5, 4, 4]); translate([10,0,0]) cube([1.5, 4, 4]); }
            translate([5,210,-1]) {cube([1.5, 4, 4]); translate([10,0,0]) cube([1.5, 4, 4]); }
            
            translate([55,200,-1]) {cube([1.5, 4, 4]); translate([10,0,0]) cube([1.5, 4, 4]); }
            
            translate([90,210,-1]) {cube([1.5, 4, 4]); translate([15,0,0]) cube([1.5, 4, 4]); }
            translate([90,180,-1]) {cube([1.5, 4, 4]); translate([15,0,0]) cube([1.5, 4, 4]); }
            
            translate([90,100,-1]) {cube([1.5, 4, 4]); translate([15,0,0]) cube([1.5, 4, 4]); }
        }
        // side mounts
        // relay
        translate([0,43,10]) rotate([0,90,0]) difference()
        {
            roundcube([10,7,4]);
            translate([4,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
        }
        // board
        translate([0,105,10]) rotate([0,90,0]) difference()
        {
            roundcube([10,7,4]);
            translate([4,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
        }
        translate([0,198,10]) rotate([0,90,0]) difference()
        {
            roundcube([10,7,4]);
            translate([4,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
        }
        translate([110,0,0])
        {
            translate([0,105,10]) rotate([0,90,0]) difference()
            {
                roundcube([10,7,4]);
                translate([4,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
            }
            translate([0,198,10]) rotate([0,90,0]) difference()
            {
                roundcube([10,7,4]);
                translate([4,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
            }
        }
    }
}

module CaseBack() color(RED) render()
{
    difference()
    {
        union()
        {
            difference()
            {
                translate([-0.2,246,0]) cube([114.4, 3, 116.621]);
                // usb
                translate([20,236,70]) cube([13.5,15,6]);
                translate([17.5,237,66.5]) cube([18.5,11,12]);
            }
            translate([10,241.5,70.5]) cube([7.5,7,8]);
            translate([36,241.5,70.5]) cube([7.5,7,8]);
            
            translate([-0.2,215.3,0]) cube([114.4, 33, 3]);
        }
        translate([25,251,15]) rotate([90,0,0]) cylinder(d=7,h=10, $fn=32);
        translate([22.5,251,15]) rotate([90,0,0]) cylinder(d=5,h=10, $fn=32);
        translate([95,251,75]) rotate([90,0,0]) cylinder(d=20,h=10, $fn=32);
        for (x = [35:10:100])
            translate([x,255,15]) rotate([90,0,0]) roundcube([5,30,10]);
        // rj45
        translate([50,245.5,63]) cube([15,5,23]);
        // usb
        translate([18,240.5 + 6.5,67 + 7.5]) {
            $fn=32;
            translate([-4,0,0]) rotate([90,0,0]) cylinder(r=HI_M3, h=10);
            translate([21.5,0,0]) rotate([90,0,0]) cylinder(r=HI_M3, h=10);
        }
    }
    // rj45
    translate([50,247.5,84]) cube([15,1.5,2]);
    translate([50,247.5,63]) cube([15,1.5,2]);
    
    // case mount
    translate([-0.2,238,20]) rotate([0,90,0]) difference()
    {
        roundcube([7,10,4]);
        translate([3.5,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
    }
    translate([-0.2,238,100]) rotate([0,90,0]) difference()
    {
        roundcube([7,10,4]);
        translate([3.5,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
    }
    translate([110.2,238,20]) rotate([0,90,0]) difference()
    {
        roundcube([7,10,4]);
        translate([3.5,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
    }
    translate([110.2,238,100]) rotate([0,90,0]) difference()
    {
        roundcube([7,10,4]);
        translate([3.5,3.5,-1]) cylinder(d=HI_M3*2, h=6, $fn=32);
    }
}

STL = 0;

if (STL)
{
    if (1) color(RED)
    {
        if(0) translate([0, 0, 249]) rotate([-90,0,0]) CaseBack();
        if(1) render() translate([140, 250, 116.6]) rotate([180,0,0]) CaseMain();
        if(0) translate([0, 370, 116.6]) rotate([180,0,0]) CaseTop();
        if(0) translate([280, 0, -50.5]) CaseInner();
        if(0) translate([50,200,0]) rotate([90,0,0]) USBHolder();
    }
    if (0) rotate([90,0,0])
    {
        w = 20;
        d = 2;
        translate([0,0,0]) cube([d,10,65]);
        translate([w-d,0,0]) cube([d,10,65]);
        translate([0,-d,0]) cube([w,d,65]);
        // display mount
        if(1) translate([0,-d,65]) rotate([-55,0,0]) 
        {
            cube([w,d,90]);
            cube([d,10,90]);
            translate([w-d,0,0]) cube([d,10,90]);
        }
    }
    if (0)
    {
        translate([50,200,0]) rotate([90,0,0]) USBHolder();
        
        translate([100,0,0]) MountPi(M2, 4);
        translate([105.2,4,0]) difference() { cube([60,51,1]); translate([1,1,-1]) cube([58,49,3]); }
        
        MountRelay(M2,4);
        translate([1.2,0.75,0]) difference() { cube([24,31,1]); translate([1,1,-1]) cube([22,29,3]); }
        
        translate([0,50,0]) MountBoard(M2,4);
        translate([2,54,0]) difference() { cube([95,74,1]); translate([1,1,-1]) cube([93,72,3]); }
    }
}
else
{
    if (1) translate([0, 0, 0]) CaseTop();
    if (1) translate([0, 0, 0]) CaseMain();
    if (1) translate([0, 0, 0]) CaseInner();
    if (1) translate([0, 0, 0]) CaseBack();
    if (1) translate([18,238.5,67]) USBHolder();
        
    if (1) translate([114, 215, 0]) rotate([0,0,180]) Powersupply();
    if (1) translate([0, 142, 112]) rotate([0,180,180]) RaspberryPi();
    if (1) translate([0, 10, 45]) rotate([35,0,0]) Display();
    if (1) translate([5, 195, 56.5]) rotate([0,0,-90]) Board();
    if (1) translate([5, 80, 55]) rotate([0,0,-90]) Relay();
    if (1) translate([10, 145, 100]) Fan();

    if (0)
    {
        color("fuchsia")
        {
            translate([90,250,0]) cube([10,290,10]);
            translate([90,530,-790]) cube([10,10,790]);
            translate([90,480,-790]) cube([10,50,10]);
        }
        //cable length = 290 + 790 + 50 = 1130
        
        translate([-20,-20,-850]) LackCase();
    }
        
}

