// wunobot vapir battery module

box_length = 95;
box_width = 30;
box_height = 30;

box_thickness = 2.5;
inner_width_offset = 21;

usb_x = 7;
usb_y = 15;
usb_x_offset = 30;
usb_z_offset = -7;

wire_size = 9;
wire_depth = 5;
wire_distance = 11;
wire_offset = -5;

top_thickness = 10;

module top()
{
	translate([0,50,-box_height/2+top_thickness/2])
	cube([box_length+box_thickness, box_width+box_thickness, top_thickness], true);
}

difference()
{
	top();

	translate([0,2.5,0])
	scale(0.95,1,1)
	top();
}

module top_fins()
{
	translate([-box_thickness/2,0,-5])
	cube([1, box_width, 20], true);

	translate([box_length+box_thickness/2,0,-5])
	cube([1, box_width, 20], true);
}

translate([-box_length/2,50,0])
top_fins();



module battery_box()
{
	difference()
	{
		cube([box_length+box_thickness, box_width+box_thickness, box_height], true);
		translate([0,0,box_thickness])
		cube([box_length-inner_width_offset, box_width, box_height], true);
	}
}

module usb_hole()
{
	translate([usb_x_offset,-box_width/2-box_thickness/2,usb_z_offset])
	cube([usb_x,box_thickness/2,usb_y]);
}

module wire_routes()
{
	translate([box_length/2-inner_width_offset/2+wire_depth/2,wire_distance,box_thickness])
	cube([wire_depth,wire_size,box_height],true);

	translate([box_length/2-inner_width_offset/2+wire_depth/2,10-wire_distance,box_thickness])
	cube([wire_depth,wire_size,box_height],true);

}

module box()
{
	difference()
	{
		battery_box();
		usb_hole();
	}
}

difference()
{
	box();
	translate([0,wire_offset,0])
	wire_routes();

}
