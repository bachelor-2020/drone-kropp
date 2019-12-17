$fn=100;
u=1.6;
play=0.1;
studr=3*0.5*u;
beamh=5*u;
beamw=5*u;

ZEROISH=0.000000000000001;

module beambody(length){
	translate([0,0,2.5*u])
	minkowski() {
		cube([ZEROISH,
				length*5*u-beamw,
				beamh],
			center=true);

		cylinder(ZEROISH,
			beamw/2,
			beamw/2);
	}
}

module studhole(length=1){
	cylinder(beamh*u,studr+play/2,studr+play/2);
	cylinder(0.5*u,3.5*0.5*u,3.5*0.5*u);
	translate([0,0,beamh-0.5*u]) cylinder(0.5*u,3.5*0.5*u,3.5*0.5*u);
}


module beam(length) {
	difference(){
		translate([0,length*5*u/2,0])
			beambody(length=length);
		for (i = [0:length-1]) {
			translate([0,(2.5 + 5*i)*u,0]) studhole();
		}
	}
}

module lbeam(length=4, width=3) {
	translate([0,-4,0]) beam(length);
	rotate([0,0,90]) translate([0,-4,0]) beam(width);
}

module axle(length=2, hole=false) {
	if (hole) {
		translate([0,0,length*beamw/2]) {
			cube([u + play, 4.7 + play, length*beamw], center=true);
			cube([4.7 + play, u + play, length*beamw], center=true);
		}
	}
	else {
		translate([0,0,length*beamw/2]) {
			cube([u, 4.7, length*beamw], center=true);
			cube([4.7, u, length*beamw], center=true);
		}
	}
}

module axlehole(length) {
	axle(length,true);
}

difference(){
translate([0,0,3.5]) cube(7,center=true);
axlehole(3);
}
