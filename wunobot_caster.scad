cylinder(h=5, r1 = 10, r2 = 10);

difference()
{
	translate([0,0,5])
	sphere(10);

	translate([0,0,-5])
	cube([20,20,10],true);
}

