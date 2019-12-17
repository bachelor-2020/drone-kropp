$fn = 100;
u = 1.6; // One lego unit
play = 0.226*u; // Tolerance of holes
studr = 3*0.5*u; // Radius of stud/pin
beamh = 5*u;
beamw = 5*u;

ZEROISH = 0.000000000000001;

// Body of lego beam without holes
module beambody(length){
	translate([0, 0, 2.5*u])
	minkowski() {
		cube([ZEROISH,
				length*5*u - beamw,
				beamh],
			center = true);
		cylinder(ZEROISH, beamw/2, beamw/2);
	}
}

// Cutouts for stud/pin holes in beams
module studhole(length=1){
	cylinder(beamh*u, studr+play/2, studr+play/2);
	for (i = [0, beamh-0.5*u]) {
		translate([0,0,i]) cylinder(0.5*u, 3.5*0.5*u, 3.5*0.5*u);
	}
}


// Beam with holes
module beam(length) {
	difference(){
		translate([0, length*5*u/2, 0])
			beambody(length);
		for (i = [0 : length-1]) {
			pos = (2.5 + 5*i) * u;
			translate([0, pos, 0]) studhole();
		}
	}
}

// L shaped beam
module lbeam(length=4, width=3) {
	translate([0, -4, 0]) beam(length);
	rotate([0, 0, 90]) translate([0, -4, 0]) beam(width);
}

// Axle
module axle(length=2, hole=false) {
	if (hole) {
		translate([0, 0, length*beamw/2]) {
			cube([u + play, 4.7 + play, length*beamw], center=true);
			cube([4.7 + play, u + play, length*beamw], center=true);
		}
	}
	else {
		translate([0, 0, length*beamw/2]) {
			cube([u, 4.7, length*beamw], center=true);
			cube([4.7, u, length*beamw], center=true);
		}
	}
}

// Cutout for axle holes
module axlehole(length) {
	axle(length, true);
}

difference(){
translate([0,0,3.5]) cube(7,center=true);
axlehole(3);
}
