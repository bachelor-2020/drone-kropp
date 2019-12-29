include <config/main_config.scad>
include <lego/lego.scad>;

// Arm bracket is the part of motormount that the arm screws into
module armbracket(){
	difference(){
		translate([-1.5*beamw, 0, 0]) cube([3*beamw, beamw, beamh]);
		translate([5, 2.5, 0]*u) studhole();
		translate([0, 2.5, 0]*u) studhole();
		translate([-5, 2.5, 0]*u) studhole();
	}
}


// Motor bracket is the part of motormount that motor screws into
module motorbracket(inner=MOTOR_SCREW_DISTANCE_MIN, outer=MOTOR_SCREW_DISTANCE_MAX, screwdia=MOTOR_SCREW_DIA){

	// Screwholes
	module screwhole(dia, length){
		cylinder (length, dia*1.1/2, dia*1.1/2);
	}

	thickness = 3;
	r = (outer/2 + screwdia)*1.05;
	translate([0, r-2, 0]){
		difference(){

			// Main body of motor bracket
			cylinder(thickness, r, r);

			// Motor mounting slots
			for (d = [0 : 90 : 360]){
				rotate ([0, 0, d+45])
				hull(){
					translate ([inner/2, 0, 0])
						screwhole(screwdia, thickness);
					translate ([outer/2, 0, 0])
						screwhole(screwdia, thickness);
				}
			}

			// Cutoff for arm mount
			translate([-r, -r, 0])
				cube([r*2, 2, thickness]);

		}

		// Motor placeholder model
		if (PLACEHOLDERS)
			#mirror([0, 0, 1])
			import("EMAX_RSII_2206_2300kv.stl");
	}
}

// Motor mount is the whole part. This is the one that should be printed
module motormount(){
	motorbracket();

	rotate([90, 0, 90])
		translate([-beamw*1.5, 0, -beamw/2])
		armbracket();
}
