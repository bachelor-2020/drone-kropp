include <lego/lego.scad>
include <motormount.scad>
import("rpi_mount.stl");

translate([-40,20,beamw/2])
rotate([0,90,45])
difference(){
	beam(4);
	translate([-beamh/2,0,0])
	cube([beamh, 5*u, beamh]);

}
translate([35,25,beamw/2])
rotate([0,90,-45])
difference(){
	beam(4);
	translate([-beamh/2,0,0])
	cube([beamh, 5*u, beamh]);

}translate([-35,-25,beamw/2])
rotate([0,90,135])
difference(){
	beam(4);
	translate([-beamh/2,0,0])
	cube([beamh, 5*u, beamh]);

}
translate([40,-20,beamw/2])
rotate([0,90,-135])
difference(){
	beam(4);
	translate([-beamh/2,0,0])
	cube([beamh, 5*u, beamh]);

}
