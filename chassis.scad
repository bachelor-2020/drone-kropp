include <lego/lego.scad>
include <RPI.scad>


module rpi_mount(){
	padding = 10;
	length = RPI_LENGTH + padding;
	diagonal = sqrt(1/2)*length;
	cutoff = 15;
	difference(){
		translate([0,0,2.5])
		cube([length, length, 5], center=true);

		for (d = [45:90:405])
			rotate([0,0,d])
			translate([length+diagonal-cutoff,0,0])
			cube(2*length,center=true);
	}

}

rpi_mount();
translate([0,0,5])
#rpi();
