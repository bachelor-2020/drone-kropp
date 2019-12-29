
// --------------------------------------------------
//
// User parameters:
//
// --------------------------------------------------

PLACEHOLDERS = false;
LOWRES = true;

// Battery dimensions
BATTERY_SIZE = [208, 73, 25];


// There are 3 different types of arms available:
//``````````````````````````````````````````````
// Type 1:
//              _____
// O-----------|     |-----------O
//             |     |
//
// Type 2:
//              _____
// O===========|     |===========O
//             |     |
//
//Type 3:
//              _____
// O-----------|     |-----------O
//  ``''**~..,,|     |,,..~**''´´

ARM_TYPE = 1;
ARM_LENGTH = 21; // Arm length in number of lego holes


// Motor mount
MOTOR_SCREW_DIA = 3;
MOTOR_SCREW_DISTANCE_MIN = 12;
MOTOR_SCREW_DISTANCE_MAX = 19;

// Landing gear
LANDING_LENGTH = 3; // Landing gear length (height?) in number of lego holes


// --------------------------------------------------
//
// DO NOT EDIT BELOW THIS LINE:
//
// --------------------------------------------------

$fn = LOWRES ? 14 : 100;

