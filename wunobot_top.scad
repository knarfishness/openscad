// wunobot, the wireless arduino uno robot
// version 0.1
// written by knarfishness for dieselpoweredrobotics.com

// to-do:
// add hole for caster, maybe 2
// adjust offset for motor zip ties
// add breadboard holder
// shape the front up



base_width = 113;
base_length = 115-35;
base_thickness = 2.5;

frontplate_width = 20;
frontplate_length = 80;

vmotormount_height = 25;
vmotormount_width = 25;
vmotormount_length = 40;
vmotormount_thickness = 3;

vmotormount_hole = 7.5;
motorback_hole = 5.5;

caster_hole = 3;
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

top_height = 35;
top_thickness = 6;

ping_hole_size = 16.25; //.5 tolerance
ping_hole_distance = 25;


module bottom_plate()
{
	cube([base_width,base_length,base_thickness]);
}

module top()
{

	difference()
	{
		cube([base_width, base_length, top_height]);
		
		translate([top_thickness/2, top_thickness/2, 1])
		cube([base_width-top_thickness, base_length-top_thickness, top_height]);
	}
}

module top_cuts()
{
	// translate([20,75,base_thickness+1])
	// cube([70,10,top_height]);

	translate([top_thickness/2,-2,base_thickness])
	cube([base_width-top_thickness,5,top_height]);
}

module zip_holes()
{
	// left caster hole
	translate([vmotormount_width/2,base_length-caster_offset,0])
	cylinder(top_height+5, caster_hole, caster_hole);

	// right caster hole
	translate([base_width-vmotormount_width/2,base_length-caster_offset,0])
	cylinder(top_height+5, caster_hole, caster_hole);


}

//zip_holes();


translate([(base_width/2)-5,-10,0])
cube([10,15,base_thickness]);



module front_plate()
{
	translate([(base_width/2), base_length, 0])
	cylinder(base_thickness,fp_radius,fp_radius);

}

module logo()
{
	import_stl("/Users/favery/Dropbox/dpr_logo_letter.stl");

	rotate(180,0,0)
	translate([-370,-304,0])
	import_stl("/Users/favery/Dropbox/dpr_logo_letter.stl");
}






module createMeniscus(h,radius) // This module creates the shape that needs to be substracted from a cube to make its corners rounded.
difference(){        //This shape is basicly the difference between a quarter of cylinder and a cube
   translate([radius/2+0.1,radius/2+0.1,0]){
      cube([radius+0.2,radius+0.1,h+0.2],center=true);         // All that 0.x numbers are to avoid "ghost boundaries" when substracting
   }

   cylinder(h=h+0.2,r=radius,$fn = 25,center=true);
}


module roundCornersCube(x,y,z,r)  // Now we just substract the shape we have created in the four corners
difference(){
   cube([x,y,z], center=true);

translate([x/2-r,y/2-r]){  // We move to the first corner (x,y)
      rotate(0){  
         createMeniscus(z,r); // And substract the meniscus
      }
   }
   translate([-x/2+r,y/2-r]){ // To the second corner (-x,y)
      rotate(90){
         createMeniscus(z,r); // But this time we have to rotate the meniscus 90 deg
      }
   }
      translate([-x/2+r,-y/2+r]){ // ... 
      rotate(180){
         createMeniscus(z,r);
      }
   }
      translate([x/2-r,-y/2+r]){
      rotate(270){
         createMeniscus(z,r);
      }
   }
}

module cutoff()
{
	rotate([0,0,0])
	translate([0,-87,base_thickness+2])
	cube(base_width, 50, 20);
}

module ping_sensor()
{
	rotate([90,0,0])
	cylinder(h = 15, r1 = ping_hole_size/2, r2 = ping_hole_size/2);

	rotate([90,0,0])
	translate([27,0,0])
	cylinder(h = 15, r1 = ping_hole_size/2, r2 = ping_hole_size/2);
}

module ping_sensors()
{
	translate([base_length/2+1.5,base_length+7,15])
	ping_sensor();

	rotate([0,0,90])
	translate([38.5,7,15])
	ping_sensor();

	rotate([0,0,90])
	translate([38.5,-base_width+7,15])
	ping_sensor();
}





module plate()
{
	difference()
	{
		difference()
		{
			top();
			ping_sensors();
		}
		
 		top_cuts();
	}
	bottom_plate();
	//front_plate();
}

module all()
{
	difference()
	{
		plate();

		rotate([180,0,0])
		translate([28,-60,-10])
		scale([0.15,0.15,1])
		logo();
	}
}

difference()
{
	all();
	cutoff();
}

		








//battery_plate();

//translate([base_width/2-unoDimensions[0]/2,0,base_thickness])
//bumper(UNO);




