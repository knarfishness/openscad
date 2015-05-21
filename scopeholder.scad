tube_height = 10;
tube_outer = 8;
tube_inner = 8;
thickness = 3;


module scope_holder()
{
	difference()
	{
		cylinder(tube_height, tube_outer, tube_inner);
		translate([0,0,-1])
		cylinder(tube_height+2, tube_outer-thickness, tube_inner-thickness);

	}
	
}

module hole()
{
	translate([0,0,5])
	rotate([90,0,0])
	cylinder(10,1.5,1.4);
}

difference()
{
	scope_holder();
	hole();
}
