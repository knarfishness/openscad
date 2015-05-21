// Parametric Desk-Clamp Hook
// Designed by knarfishness for
// dieselpoweredrobotics.com


// Clamp Spacing
clamp_spacing = 40;

// The thickness of the hook
thickness = 5;

// The length of the top-bar
top_bar_length = 50;

// The radius of the hook
hook_radius = 20;

// The size of the hook-end
hook_end_radius = 0;

// Overall hook width
width = 15;


module hook()
{
	module topbar()
	{
		cube([top_bar_length, thickness, width]);
	}
	
	module clampbar()
	{
		translate([0,0-clamp_spacing,0])
		cube([thickness,clamp_spacing,width]);
	}
	
	module bottombar()
	{
		translate([0,0-clamp_spacing-thickness,0])
		cube([top_bar_length,thickness,width]);
	}
	
	module clamp()
	{
		union()
		{
			topbar();
			clampbar();

		}
	}
	
	module wholeclamp()
	{
		union()
		{
			clamp();
			bottombar();
		}
	}
	
	module hookloop()
	{
		translate([top_bar_length-hook_radius,0-clamp_spacing-thickness,0])
		intersection()
		{
			translate([-hook_radius,-hook_radius*2,0])
			cube([hook_radius*2,hook_radius*2,width]);

			cylinder(h = width, r1 = hook_radius, r2 = hook_radius, center = false);
		}
		
		
		//
	}
	
	module hookend()
	{
	
	}
	
	wholeclamp();
	hookloop();
	
}

hook();