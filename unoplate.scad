// uno prototyping plate
// by knarfishness for dieselpoweredrobotics.com

include <arduino.scad>

unoDimensions = boardDimensions( UNO );

plate_thickness = 3;
plate_width = 100;
plate_length = 160;

uno_offset = -35;

bb_length = 45.5;
bb_width = 35;
bb_height = 10; 
bb_holder_thickness = 3;
bb_offset = 63;


module bb_holder()
{
	translate([plate_width/2,plate_length-bb_offset,plate_thickness+bb_height/2])
	difference()
	{
		cube([bb_length+bb_holder_thickness,bb_width+bb_holder_thickness,bb_height], true);
		cube([bb_length, bb_width, bb_height], true);
		
	}
}

bb_holder();

translate([0,40,0])
bb_holder();


module plate()
{
	cube([plate_width, plate_length, plate_thickness]);
}

plate();


translate([plate_width/2-unoDimensions[0]/2,plate_length/2-unoDimensions[1]/2+uno_offset,plate_thickness])
bumper(UNO);