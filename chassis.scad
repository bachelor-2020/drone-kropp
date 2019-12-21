include <lego/lego.scad>
include <rpi/RPI.scad>

PLATE_THICKNESS = beamh;
padding = 17;
length = RPI_LENGTH + padding;
diagonal = sqrt(1/2)*length;
cutoff = 12;
radius = diagonal-cutoff;

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

module rpi_mount_plate(){
	difference(){
		sandwich_plate();
		rpi_screwholes();
	}
}

module arm_bracket(){
	translate([-beamw/2,0,beamw/2])
	rotate([0,90,0])
	difference(){
		translate([0,-beamw,0])
		beam(5);
		translate([-beamw/2,-beamw,0])
		cube(beamw);
	}
}

for (d = [0:90:360])
rotate([0,0,d+45])
translate([0,radius,0])
arm_bracket();

rpi_mount_plate();
#translate([0, 0, PLATE_THICKNESS])
rpi();
