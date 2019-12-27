include <lego/lego.scad>;

module armbracket(){
	difference(){
		translate([-1.5*beamw, 0, 0]) cube([3*beamw, beamw, beamh]);
		translate([5, 2.5, 0]*u) studhole();
		translate([0, 2.5, 0]*u) studhole();
		translate([-5, 2.5, 0]*u) studhole();
	}
}

module motorbracket(inner=12, outer=19, screwdia=3){
	r = (outer/2 + screwdia)*1.05;
	translate([0, r-2, 0])
	difference(){
		cylinder(3, r, r);
		for (d = [0 : 90 : 360]){
			rotate ([0, 0, d+45])
			hull(){
				translate ([inner/2, 0, 0])
					cylinder (3, screwdia*1.1/2, screwdia*1.1/2);
				translate ([outer/2, 0, 0])
					cylinder (3, screwdia*1.1/2, screwdia*1.1/2);
			}
		}
		translate([-r, -r, 0])
			cube([r*2, 2, 3]);

	}
}

module motormount(){
	motorbracket();

	rotate([90, 0, 90])
		translate([-beamw*1.5, 0, -beamw/2])
		armbracket();
}
