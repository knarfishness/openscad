// "scooter part from the 80s"
// request from makexyz
// by knarfishness for dieselpoweredrobotics.com

outer_cyl_od = 54.35;
outer_cyl_id = 49;
outer_cyl_height = 3.53;

inner_cyl_od = 50;
inner_cyl_id = 26;
inner_cyl_height = 2.3;

inner_hole = 26;

peg_l1_od = 6.5;
peg_l1_height = 8;

peg_l2_od = 4.6;
peg_l2_height = 6.3;

peghole_od = 3;

module outer_cyl()
{
	difference()
	{
		cylinder(outer_cyl_height, (outer_cyl_od/2), (outer_cyl_od/2));
		translate([0,0,-1])
		cylinder(outer_cyl_height+2, outer_cyl_id/2, outer_cyl_id/2);
	}
	
}

module inner_cyl()
{
	difference()
	{
		cylinder(inner_cyl_height, inner_cyl_od/2, inner_cyl_od/2);
		translate([0,0,-1])
		cylinder(outer_cyl_height+2, (outer_cyl_od/2)-inner_hole/2, (outer_cyl_od/2)-inner_hole/2);
	}
	
}

module peg_outer()
{
	cylinder(peg_l1_height, peg_l1_od/2, peg_l1_od/2);

	translate([0,0,peg_l1_height])
	cylinder(peg_l2_height, peg_l2_od/2, peg_l2_od/2);
}

module peg()
{
	translate([0,0,inner_cyl_height])
	difference()
	{
		peg_outer();
		translate([0,0,1])
		cylinder(peg_l1_height+peg_l2_height, peghole_od/2, peghole_od/2);
	}
}

rotate([0,0,120])
{
	translate([inner_cyl_id-3,0,0])
	peg();
}

rotate([0,0,240])
{
	translate([inner_cyl_id-3,0,0])
	peg();
}

translate([inner_cyl_id-3,0,0])
peg();


// translate([0,10,0])
// peg();

// translate([-10,-10,0])
// peg();








module scooter_part()
{
	inner_cyl();
	outer_cyl();
}

scooter_part();






