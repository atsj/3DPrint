

$fn=200;

//note, change interior translation parameter when changing sizefactor
sizefactor = 0.61515;

//all the numbers below are in mm, including translations


    {   //flange/base
        nlength = 330.20 * sizefactor;
        nwidth= 189.69 * sizefactor * 1.30;
        nheight = 5.17 * sizefactor;
        nradius = 10 * sizefactor;
        ndRadius = 2*nradius;


        translate([-14.05*sizefactor, -14.05*sizefactor, 0*sizefactor]) {
            minkowski() {
                cube(size=[nwidth-ndRadius,nlength-ndRadius,        nheight]);
                cylinder(r=nradius, h=0.01);
            }
        }
    }


difference() {
    {   //outer rim (inserts into headliner)
        length = 302.10 * sizefactor;
        width= 161.59 * sizefactor * 1.30;
        height = 24.59 * sizefactor;
        radius = 10 * sizefactor;
        dRadius = 2*radius;

        translate([0*sizefactor, 0*sizefactor, 0*sizefactor]) {
            minkowski() {
                cube(size=[width-dRadius,length-dRadius, height]);
                cylinder(r=radius, h=0.01);
            }
        }   
    };

       

     {  //interior (to remove)
        ilength = 295.07 * sizefactor;
        iwidth= 151.05 * sizefactor * 1.32;
        iheight = 24.59 * sizefactor;
        iradius = 10 * sizefactor;
        idRadius = 2*iradius;
        translate([5.27*sizefactor, 3.51*sizefactor, 10.54*sizefactor]){
            minkowski() {
                cube(size=[iwidth-idRadius,ilength-idRadius,        iheight]);
                cylinder(r=iradius, h=0.01);
            }
        }
    };
}
   
