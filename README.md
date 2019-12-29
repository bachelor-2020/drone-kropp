# Lego drone chassis

This is a parametric and customizable drone chassis, made of some custom 3D printed parts and lego. It is built with the main goal of being modular and reconfigurable. The drone uses an RPI 3 B+ and an Emlid Navio2 as flight controller, but could easily be modified to accept any type of flight controller. It will also include optional mounting parts for among other things Arduino Uno, Grid-EYE thermal sensor, Intel RealSense stereo camera.

## Prerequisites
To use the project you will need these prerequisites:

### Software
 - OpenSCAD
 - A slicer and 3D printing software

### Hardware
 - 3D printer
 - Raspberry Pi 2 B or better
 - Emlid Navio2 or other flight controller
 - Drone motors and ESCs
 - Propellers
 - Lego beams and pins

#### Optional
 - Radio receiver and transmitter (for manual control)
 - Intel RealSense stereo camera (for obstacle detection and mapping)
 - Lidar (for obstacle detection and mapping)
 - Grid-EYE thermal sensor

## Configuring
Configuration is done through the main configuration file `config/main_config.scad`. Change parameters in this file as needed.

## Previewing
To preview the assembled drone chassis, open assembly.scad and render it.

## Exporting the parts for print
Exporting the parts for print is for the moment a manual process. It involves creating a new scad file,  or modifying assembly.scad to only show the part you want to export, then rendering and exporting the part as stl. This process will hopefully become more user friendly in the future. There are plans to make an automated process for this, as well as global configuration of the project.

## Assembling
To assemble the drone, please see assembly.scad and try to assemble the parts to match the preview. Some lego parts are required, but most can be printed if necessary.
