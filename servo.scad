module servoarms()
{
	translate([13.5,-2,-26.5]) cube([3.3,4,13]);
	translate([-16.5,-2,-26.5]) cube([3.3,4,13]);
}

module dplogo()
{
	translate([20,-20,-26])
	rotate([0,180,0])
	scale([0.05, 0.05, 0.540])
	import("/Users/favery/Downloads/outerlogo_fixed.stl");
}


union()
{
	//difference() {
	//	import("/Users/favery/Downloads/servo_fixed.stl");
		dplogo();
	//}
	
	servoarms();
}

