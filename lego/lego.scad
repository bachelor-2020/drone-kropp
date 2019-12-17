$fn = 100;
u = 1.6; // One lego unit
play = 0.226*u; // Tolerance of holes
studr = 3*0.5*u; // Radius of stud/pin
beamh = 5*u;
beamw = 5*u;

ZEROISH = 0.000000000000001;

// Body of lego beam without holes
module beambody(length){
	translate([0, 0, beamh/2])
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
	r = studr + play/2;
	insert_radius = 3.5*0.5*u + play;
	insert_height = 0.5*u + play/2;
	cylinder(beamh*length, r, r);
	for (i = [0, beamh-insert_height]) {
		translate([0,0,i]) cylinder(insert_height, insert_radius, insert_radius);
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
	a = hole ? u+play : u;
	b = hole ? 4.7+play : 4.7;
	translate([0, 0, length*beamw/2]) {
		cube([a, b, length*beamw], center=true);
		cube([b, a, length*beamw], center=true);
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
