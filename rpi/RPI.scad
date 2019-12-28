RPI_WIDTH = 56;
RPI_LENGTH = 85;

module rpi_cutout(height = 10, padding = 5){
	width = RPI_WIDTH+padding;
	length = RPI_LENGTH+padding;
	translate([0, 0, height/2])
	cube([length, width, height], center=true);
}

module rpi(){
	import("rpi/rpi.stl");

	translate([-14.2, 0.2, 15])
		import("rpi/navio2.stl");
}

module rpi_screwholes(height = 10){
	module m3(){
		cylinder(height, 1.6, 1.6);
	}
	translate([-RPI_LENGTH/2, 0, 0]){
		for (x = [3.5, 61.5], y = [-1,1]*(RPI_WIDTH/2 - 3.5)){
			translate([x,y])
			m3();
		}
	}
}
