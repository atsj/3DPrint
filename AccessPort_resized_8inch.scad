//note, change interior translation parameter when changing sizefactor -- image centered on the corner.  Just changing sizefactor will shift it slightly leaving uneven thicknesses.
sizefactor = 0.61515;

//all the numbers below are in mm, including translations.  Original intent was length of 13 in (330.2mm).  Unable to find printer with table that large.  Sizefactor shrinks to 8 inches.
//note:  OK to shrink the flange/base (largest rectangle) individually if needed for slight changes to fit printer table.
//Currently nlength (330.2mm) * sizefactor (0.61515) = 203.123mm (7.997in).
//Currently nwidth (189.69mm) * sizefactor (0/61515) = 116.688mm (4.595in).


    {   //flange/base
        nlength = 330.20 * sizefactor;
        nwidth= 189.69 * sizefactor * 1.30;
        nheight = 5.17 * sizefactor;
        nradius = 10 * sizefactor;
        ndRadius = 2*nradius;


        translate([-16.05*sizefactor, -14.05*sizefactor, 0*sizefactor]) {
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

        translate([2*sizefactor, 2*sizefactor, 0*sizefactor]) {
            minkowski() {
                cube(size=[width-dRadius,length-dRadius, height]);
                cylinder(r=radius, h=0.01);
            }
        }   
    };

       

     {  //interior (to remove)
        ilength = 298.07 * sizefactor;
        iwidth= 154.05 * sizefactor * 1.32;
        iheight = 26.59 * sizefactor;
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
   
