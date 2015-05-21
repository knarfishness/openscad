// wunobot, the wireless arduino uno robot
// version 0.1
// written by knarfishness for dieselpoweredrobotics.com

// to-do:
// add hole for caster, maybe 2
// adjust offset for motor zip ties
// add breadboard holder
// shape the front up


include <arduino.scad>

unoDimensions = boardDimensions( UNO );

base_width = 110;
base_length = 115;
base_thickness = 2.5;

frontplate_width = 20;
frontplate_length = 80;

vmotormount_height = 25;
vmotormount_width = 25;
vmotormount_length = 40;
vmotormount_thickness = 3;

vmotormount_hole = 7.5;
motorback_hole = 5.5;

caster_hole = 4.95;
caster_offset = 10;

zip_thickness = 2;
zip_width = 5;
zip_offset = 10;

fp_radius = 35;

servo_length = 23.5;
servo_width = 12;

bb_length = 45.5;
bb_width = 35;
bb_height = 10; 
bb_holder_thickness = 2.5;
bb_offset = 22;

batt_width = 80;
batt_length = 20;
batt_zip_offset = 5;

module battery_plate()
{
	translate([base_width/2-batt_width/2, -batt_length, 0])
	cube([batt_width, batt_length, base_thickness]);
}


module bottom_plate()
{
	cube([base_width,base_length,base_thickness]);
}

module front_plate()
{
	translate([(base_width/2), base_length, 0])
	cylinder(base_thickness,fp_radius,fp_radius);
}

module servo_mount()
{
	translate([base_width/2-(servo_width/2),base_length+(fp_radius/2-servo_length/2),0])
	cube([servo_width,servo_length,base_thickness*2]);
}



difference()
{
	front_plate();
	servo_mount();
}


module motor_mounts()
{
	module motor_left()
	{
		difference()
		{
			cube([vmotormount_width,vmotormount_length,vmotormount_height]);
			translate([vmotormount_thickness,vmotormount_thickness,0])
			cube([vmotormount_width-vmotormount_thickness,vmotormount_length-vmotormount_thickness,vmotormount_height]);
		}
	}

	module motor_right()
	{
		translate([base_width-vmotormount_width,0,0])
		difference()
		{
			cube([vmotormount_width,vmotormount_length,vmotormount_height]);
			translate([vmotormount_thickness-(vmotormount_thickness*2),vmotormount_thickness,0])
			cube([vmotormount_width,vmotormount_length,vmotormount_height]);
		}
	}
	motor_left();
	motor_right();
}

module mount_holes()
{
	// round motor mount holes
	translate([-base_thickness,vmotormount_length/2,vmotormount_height/2])
	rotate([0,90,0])
	cylinder(base_width+(base_thickness*2),vmotormount_hole,vmotormount_hole);
	
	//top zip tie holder
	translate([0,vmotormount_length/2-zip_width/2+zip_offset,vmotormount_height-zip_thickness])
	cube([base_width, zip_width, zip_thickness]);

	// back of motor holes
	translate([vmotormount_width/2,vmotormount_thickness+1,vmotormount_height/2])
	rotate([90,0,0])
	cylinder(vmotormount_thickness+2, motorback_hole, motorback_hole);

	translate([base_width-vmotormount_width/2,vmotormount_thickness+1,vmotormount_height/2])
	rotate([90,0,0])
	cylinder(vmotormount_thickness+2, motorback_hole, motorback_hole);
}

module bb_holder()
{
	translate([base_width/2,base_length-bb_offset,base_thickness+bb_height/2])
	difference()
	{
		cube([bb_length+bb_holder_thickness,bb_width+bb_holder_thickness,bb_height], true);
		cube([bb_length, bb_width, bb_height], true);
		
	}
}

bb_holder();


module zip_holes()
{
	// left zip hole
	translate([vmotormount_width-5,vmotormount_length/2+zip_offset,0])
	cube([zip_thickness,zip_width,base_thickness+10]);

	// right zip hole
	translate([base_width-vmotormount_width-zip_thickness+5,vmotormount_length/2+zip_offset,0])
	cube([zip_thickness,zip_width,base_thickness+10]);

	// left caster hole
	translate([vmotormount_width/2,base_length-caster_offset,0])
	cylinder(base_thickness, caster_hole, caster_hole);

	// right caster hole
	translate([base_width-vmotormount_width/2,base_length-caster_offset,0])
	cylinder(base_thickness, caster_hole, caster_hole);


}

difference()
{
	motor_mounts();
	mount_holes();
}

difference()
{
	bottom_plate();
	zip_holes();
}

//battery_plate();

translate([base_width/2-unoDimensions[0]/2,0,base_thickness])
bumper(UNO);




