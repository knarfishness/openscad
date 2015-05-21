module test()
{
// square([4,16]);	
// polygon([ [0,0],[5,0],[5,5],[0,5] ], [ [0,1,2,3] ]);
// sphere(6);
// cylinder(h=20, r1=5, r2=0);
// cube([4,8,16]);

// relocate part
// translate([10,20,30]) cube(5);

// rotate part
// rotate([90,0,0]) cube([4,8,16.5]);

// scale part
// scale([2,1,1]) sphere(5); //makes an ellipical sphere

// overlapping parts
// translate([0,-25,-25]) cylinder(50,10,10);
// rotate([90,0,0]) cylinder(50,8,8);

// removing sections
// difference() 
// {
// 	translate([0,-25,-25]) cylinder(50,10,10); //form to subtract from 
// 	rotate([90,0,0]) cylinder(50,8,8); //section to remove
// }

// fetch overlap
intersection()
{
	translate([0,-25,-25]) cylinder(50,10,10);
	rotate([90,0,0]) cylinder(50,8,8);
}

// merged parts
// union()
// {
	// translate([0,-25,-25]) cylinder(50,10,10);
	// rotate([90,0,0]) cylinder(50,8,8);
// }

// union()
// {
// rotate([180,0,0]) scale([0.05, 0.05, 0.15]) import("/Users/favery/Downloads/dplogo.stl");
// import("/Users/favery/Downloads/servo_fixed.stl");
// translate([13.5,-2,-26.5]) cube([3.3,4,13]);
// translate([-16.5,-2,-26.5]) cube([3.3,4,13]);
// }

}


test();
