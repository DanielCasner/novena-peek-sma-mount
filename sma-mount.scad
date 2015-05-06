peekSpacing = 30;
wallThickness = 5;
fastnerRadius = 2;
fastnerHeadRadius = 4;
smaRadius = 4;
smaHeadRadius = 6;

blockWidth  = peekSpacing*2 + wallThickness*2;
blockHeight = wallThickness + smaHeadRadius*3;
blockDepth  = wallThickness + fastnerHeadRadius*3;

difference() {
    translate([-wallThickness, -wallThickness-fastnerHeadRadius*1.5, 0]) {
        union() {
            cube([blockWidth, blockDepth,   wallThickness]);
            cube([blockWidth, wallThickness, blockHeight]);
        }
    }
    for (x = [0 : peekSpacing : peekSpacing*2]) {
        translate([x, 0, -1]) cylinder(r=fastnerRadius, h=wallThickness*2);
    }
    rotate([90, 0, 0]) {
        for (x = [smaHeadRadius/2 : smaHeadRadius*3 : smaHeadRadius*10]) {
            translate([x,wallThickness+smaHeadRadius*2,]) cylinder(r=smaRadius, h=100);
        }
    }
}