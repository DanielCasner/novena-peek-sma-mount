peekSpacing = 30;
wallThickness = 3;
fastnerRadius = 2;
fastnerHeadRadius = 4;
fastnerHeadHeight = 3;
smaRadius = 3;
smaHeadRadius = 5;

blockWidth  = peekSpacing*2 + wallThickness*2;
blockHeight = wallThickness + smaHeadRadius*2;
echo(blockHeight=blockHeight);
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
        for (x = [-peekSpacing*3/4 : peekSpacing*2/4 : peekSpacing*3/4]) {
            translate([x+peekSpacing, wallThickness+smaHeadRadius, 0]) cylinder(r=smaRadius, h=100);
        }
    }
}