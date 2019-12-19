RPI_WIDTH = 56;
RPI_LENGTH = 85;

module rpi_cutout(height = 10){
	translate([0,0,height/2])
	cube([RPI_WIDTH, RPI_LENGTH, height], center=true);
}

module rpi(){
translate([-3-RPI_LENGTH/2, -1.55-RPI_WIDTH/2,0])
	import("rpi.stl");
}

module rpi_screwholes(height = 10){
	module m3(){
		cylinder(height, 1.6, 1.6);
	}
	translate([-RPI_LENGTH/2, 0, 0]){
		for (x = [3.5, 61.5])
		for (y = [-1,1]*(RPI_WIDTH/2 - 3.5)){
			translate([x,y,0]) m3();
		}
	}
}
