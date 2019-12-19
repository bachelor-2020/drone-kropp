include <lego/lego.scad>
include <motormount.scad>

module armmount_horizontal(){
	rotate([0,90,0])
	translate([-beamw/2,-beamw,-beamh/2])
	difference(){
		beam(4);
		translate([-beamh/2,0,0])
		cube([beamh, beamw, beamh]);
	}
}

module armmount_vertical(){
	translate([0,beamw,0])
	rotate([90,0,0])
	armmount_horizontal();
}

module rpi_mount(){
	import("rpi_mount.stl");
}



for (i = [0,1])
for (j = [0,1])
	mirror([i,0,0])
	mirror([0,j,0])
	translate([43,28,0])
	rotate([0,0,-45])
	armmount_vertical();

translate([0,0,beamw/2])
difference(){
	cube([90,60,beamw],center=true);
	cube([90-beamw,60-beamw,beamw],center=true);
}

translate([0, 0, 2*beamw])
rpi_mount();
