include <lego/lego.scad>
include <rpi/RPI.scad>

PLATE_THICKNESS = beamh;
padding = 17;
length = RPI_LENGTH + padding;
diagonal = sqrt(1/2)*length;
cutoff = 12;
radius = diagonal-cutoff;

module place_on_corners(distance=0){
	for (d = [0 : 90 : 360])
		rotate([0, 0, d+45])
		translate([0,radius+distance,0])
		children();
}

module sandwich_plate(){
	difference(){
		translate([0, 0, PLATE_THICKNESS/2])
		cube([length, length, PLATE_THICKNESS], center=true);

		for (d = [45 : 90 : 405])
			rotate([0, 0, d])
			translate([length + radius, 0, 0])
			cube(2*length, center=true);
	}
}

module rpi_mount_plate(bracket_length=1){
	place_on_corners()
	arm_bracket(bracket_length);
	difference(){
		sandwich_plate();
		rpi_screwholes();
		translate([0,0,2]) {
			rpi_cutout();
			scale([0.9,0.9,1.1]) sandwich_plate();
		}
	}
	#translate([0, 0, 2])
	rpi();
}

module arm_plate(bracket_length=3){
	place_on_corners()
	arm_bracket(bracket_length);
	difference(){
		sandwich_plate();
		translate([0,0,-0.1])
		scale([0.9,0.9,1.1]) sandwich_plate();
	}
}


module arm_bracket(length=4){
	translate([-beamw/2,0,beamw/2])
	rotate([0,90,0])
	difference(){
		translate([0,-beamw,0])
		beam(length+1);
		translate([-beamw/2,-beamw,0])
		cube(beamw);
	}
}

module arm_bracket_double(length=4){
	for (x = [-1,1]*beamw){
		translate([x,0,0]) arm_bracket(length);
	}
}

rpi_mount_plate();
