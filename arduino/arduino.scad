ARDUINO_WIDTH = 54;
ARDUINO_LENGTH = 69;

module arduino_cutout(height = 10, padding = 5){
	width = ARDUINO_WIDTH + padding;
	length = ARDUINO_LENGTH + padding;

	translate([0, 0, height/2])
		cube([length, width, height], center=true);
}

module arduino_screwholes(height = 10){
	module m3(){
		cylinder(height, 1.6, 1.6);
	}

	translate([-ARDUINO_LENGTH/2, -ARDUINO_WIDTH/2, 0]){
		pos = [
			[15.3, 50.7],
			[15.3, 2.5],
			[66.1, 7.6],
			[66.1, 35.5]
		];

		for (p = pos){
			translate(p)
			m3();
		}
	}
}

module arduino(){
	translate([-3.5,0])
	import("arduino/arduino.stl");
}
