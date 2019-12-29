include <config/main_config.scad>

include <lego/lego.scad>
include <rpi/RPI.scad>
include <chassis.scad>
include <motormount.scad>


// Main chassis sandwich
rpi_mount_plate();
translate([0, 0, 15*u]){
	arm_plate();
}


// L beam assembly
place_on_corners(){
	for (i = [-1,1]*5*u)
	mirror([0, 0, 1])
	translate([i, 0, -20*u])
	rotate([0, 0, 90])
	translate([beamw/2, beamh/2, beamw/2])
	rotate([90, 90, 0])
	lbeam(7, LANDING_LENGTH+4);
}

// Arm assembly
translate([0, 0, 15*u]){
	place_on_corners(distance=15*u)
	arm();
}

module arm(){
	translate([-beamh/2, 0, beamw/2])
	rotate([0, 90, 0])
	beam(ARM_LENGTH - 9);

	translate([0, 5*u]){
		for (i = [-1,1]*beamh)
			translate([i, 0])
			translate([-beamh/2, 15*u, beamw/2])
			rotate([0, 90, 0])
			beam(ARM_LENGTH - 7);

		translate([0, (ARM_LENGTH-4)*5*u, 5*u])
			mirror([0, 0, 1])
			motormount();
	}
}
