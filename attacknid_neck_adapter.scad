// attacknid neck cap
// by knarfishness for dieselpoweredrobotics.com

od_circle = 28.7;
id_circle =  25.75;
depth_to_fins = 7.46;
whole_depth = 14.92;
fin_width = 2;

shell_thickness = 2;
i_tolerance = 0;


module outer_shell()
{
	cylinder(whole_depth, od_circle/2+shell_thickness, od_circle/2+shell_thickness);
}


module inner_shell()
{
	translate([0,0,shell_thickness])
	cylinder(whole_depth, od_circle/2-i_tolerance, od_circle/2-i_tolerance);
}

module finset()
{
	translate([0,0,whole_depth-(depth_to_fins/2)])
	cube([100,fin_width,whole_depth-depth_to_fins], true);

	rotate(45,0,0)
	translate([0,0,whole_depth-(depth_to_fins/2)])
	cube([100,fin_width,whole_depth-depth_to_fins], true);
}

module fins()
{
	finset();
	rotate(90,0,0)
	finset();
}

module cap()
{
	difference()
	{
		outer_shell();
		inner_shell();
	}
}

difference()
{
	cap();
	fins();
}






