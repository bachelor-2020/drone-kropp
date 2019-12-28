GRIDEYE_WIDTH = 55;
GRIDEYE_LENGTH = 78;

module grideye_cutout(height = 10, padding = 5){
	width = GRIDEYE_WIDTH+padding;
	length = GRIDEYE_LENGTH+padding;

	translate([0, 0, height/2])
		cube([length, width, height], center=true);
}

module grideye_screwholes(height = 10){
	module m3(){
		cylinder(height, 1.6, 1.6);
	}
	translate([-GRIDEYE_LENGTH/2, 0, 0]){
		for (x = [4, GRIDEYE_LENGTH-4], y = [-1,1]*(GRIDEYE_WIDTH/2 - 3.5)){
			translate([x,y])
			m3();
		}
	}
}
