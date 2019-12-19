include <lego/lego.scad>;

module armbracket(){
	difference(){
		translate([-1.5*beamw,0,0]) cube([3*beamw,beamw,beamh]);
		translate([5*u, 2.5*u, 0]) studhole();
		translate([0, 2.5*u, 0]) studhole();
		translate([-5*u, 2.5*u, 0]) studhole();
	}
}

module motorbracket(inner=12, outer=19, screwdia=3){
	r = (outer/2 + screwdia)*1.05;
	translate([0, r-2, 0])
	difference(){
		cylinder(3,r,r);
		rotate([0,0,45])
		for (i = [0:90:360]){
			hull()
			for (j = [inner,outer]/2)
			rotate ([0,0,i])
			translate ([j,0,0])
			cylinder (3, screwdia*1.1/2, screwdia*1.1/2);
		}
		translate([-r,-r,0])
		cube([r*2,2,3]);

	}
}

module motormount(){
	motorbracket();

	rotate([90,0,0])
	translate([-beamw/2,0,beamw*1.5])
	rotate([0,90,0])
	armbracket();
}
