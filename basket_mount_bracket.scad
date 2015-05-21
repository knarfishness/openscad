// metal basket mount

hole_width = 16.75;
hole_height = 9.65;
hole_depth = 3.25;

screw_hole_radius = 2;

base_width = 25;
base_height = 17;

module outer_box()
{
	cube([base_width, base_height, hole_depth]);
}

module inner_box()
{
	translate([base_width/2-hole_width/2,base_height/2-hole_height/2,hole_depth])
	cube([hole_width, hole_height, hole_depth]);
}

module screw_hole_bottom()
{

	translate([base_width/2,base_height/2,0])
	cylinder(hole_depth, screw_hole_radius+1.25, screw_hole_radius);
}

module screw_hole_top()
{

	translate([base_width/2,base_height/2,hole_depth])
	cylinder(hole_depth, screw_hole_radius, screw_hole_radius);
}

module screw_holes()
{
	screw_hole_top();
	screw_hole_bottom();
}

module boxes()
{
	outer_box();
	inner_box();
}

difference()
{
	boxes();
	screw_holes();
}




