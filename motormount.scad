include <lego/lego.scad>;

module armbracket(){
	difference(){
		translate([-1.5*beamw,0,0]) cube([3*beamw,beamw,beamh]);
		translate([5*u, 2.5*u, 0]) axlehole();
		translate([0, 2.5*u, 0]) axlehole();
		translate([-5*u, 2.5*u, 0]) axlehole();
	}
}

rotate([0,90,0])
armbracket();
