include <lego/lego.scad>;

module armbracket(){
	difference(){
		translate([-1.5*beamw,0,0]) cube([3*beamw,beamw,beamh]);
		translate([5*u, 2.5*u, 0]) studhole();
		translate([0, 2.5*u, 0]) studhole();
		translate([-5*u, 2.5*u, 0]) studhole();
	}
}

module motorbracket(){
	difference(){
		cylinder(3,30,30);
		rotate([0,0,45])
		for (i = [0:90:360]){
			hull() for(j = [16,19])
			rotate([0,0,i])
			translate([j,0,0])
			cylinder(3,3.2,3.2);
		}
		translate([-30,-30,0])
		cube([30*2,2,3]);

	}
}

translate([0,30+beamw-2,0])
motorbracket();

translate([-beamw/2,0,beamw*1.5])
rotate([0,90,0])
armbracket();
