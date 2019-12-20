include <lego/lego.scad>
include <rpi/RPI.scad>

PLATE_THICKNESS = beamh;
padding = 10;
length = RPI_LENGTH + padding;
diagonal = sqrt(1/2)*length;
cutoff = 15;
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


rpi_mount_plate();
#translate([0, 0, PLATE_THICKNESS])
rpi();
