$fn=50;
module main(){
difference(){
    h = 57;
translate([0,0,h/2])cube([120,120,h],center=true);
translate([0,0,h/2-2])cube([120-4,120-4,h],center=true);
translate([0,0,h-3])
union(){
cylinder(r=45,h=3);
translate([0,44+4/2,3/2])cube([6.5,4+1,3],center=true);
translate([0,-(44+4/2),3/2])cube([6.5,4+1,3],center=true);
}
}
}

module lcdMonitor(){
    translate([0,0,3/2])cube([72,25,3+10],center=true);
}

module lcdLegs(){
    translate([(40-5/2),(18-5/2),0])
    union(){
        cylinder(r=1.25,h=8);
//        rotate([0,0,45])cylinder(r1=9/2,r2=5/2,h=8-1.5,$fn=50);
    }
    translate([-(40-5/2),(18-5/2),0])union(){
        cylinder(r=1.25,h=8);
//        rotate([0,0,45])cylinder(r1=9/2,r2=5/2,h=8-1.5,$fn=50);
    }
    translate([(40-5/2),-(18-5/2),0])union(){
        cylinder(r=1.25,h=8);
//        rotate([0,0,45])cylinder(r1=9/2,r2=5/2,h=8-1.5,$fn=50);
    }
    translate([-(40-5/2),-(18-5/2),0])union(){
        cylinder(r=1.25,h=8);
//        rotate([0,0,45])cylinder(r1=9/2,r2=5/2,h=8-1.5,$fn=50);
    }
}

module lcdLegs_whole(){
    translate([(40-5/2),(18-5/2),-1])
    union(){
        cylinder(r=1.6,h=8);
    }
    translate([-(40-5/2),(18-5/2),-1])union(){
        cylinder(r=1.6,h=8);
    }
    translate([(40-5/2),-(18-5/2),-1])union(){
        cylinder(r=1.6,h=8);
    }
    translate([-(40-5/2),-(18-5/2),-1])union(){
        cylinder(r=1.6,h=8);
    }
}

module support(){
    translate([0,0,3/2])cube([72-1,25-1,0.3],center=true);
}

//support();

difference(){
    union(){
        main();
//        translate([120/2,0,30])
//            rotate([-90,0,90])
//                lcdLegs();
    }//union
    translate([120/2,0,30])
        rotate([-90,0,90])
            lcdLegs_whole();
    translate([120/2,0,30])rotate([-90,0,90])lcdMonitor();
    hull(){
        translate([-120/2,30,0])
            rotate([0,90,0])
                cylinder(r=5,h=5);
        translate([-120/2,30,10])
            rotate([0,90,0])
                cylinder(r=5,h=5);    
    }//hull
    hull(){
        translate([-120/2,-30,0])
            rotate([0,90,0])
                cylinder(r=5,h=5);
        translate([-120/2,-30,10])
            rotate([0,90,0])
                cylinder(r=5,h=5);    
    }//hull
}//differeice


module lcdLegs_test()
translate([120/2,0,0])union(){
    translate([0,0,2/2])
    cube([30,100,2],center=true);
    translate([0,0,65/2])
    cube([2,100,65],center=true);
}
//lcdLegs_test();

