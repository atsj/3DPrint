/*  This is changed and committed to github (test file) */


/*
Step 1
- basic parameters
- $fn - 200 fragments results in a smooth shape
- minkowski is creating a rounded shape, don't forget to exclude the double radius
*/

/*
    Note:  real dimensions are as follows:
        outer flange: 13" X 8.5"
        outer flange thickness: 1/4"
        inner flange (cutout): 12"  X 7.5"
        interior: 11.5" X 7.0"  (1/4 inch thick)
        
        original sizes were:
        flange:
        nlength = 94 * sizefactor;
        nwidth= 54 * sizefactor;
        nheight = 2.5 * sizefactor;
        
        outer rim:
        length = 86 * sizefactor;
        width= 46 * sizefactor;
        height = 7 * sizefactor;

        interior:
        ilength = 84 * sizefactor;
        iwidth= 43 * sizefactor;
        iheight = 7 * sizefactor;
        
        using original size numbers, 
        94 should equate to 13 inches, or 33.02 cm, or 330.2 mm
        54 equates to 8.5" or 215.9 mm
        
        factor should be: 0.1382979  (0.1382979 * 94 = 13.0002)
        
        0.18 inches = 4.572mm
        4.572/3.10638 = 1.4718
        
        conversion from stl units to mm is: 94 = 330.2 mm (3.512766)
*/

$fn=200;

//note, change interior translation parameter when changing sizefactor
//sizefactor = 3.10638;
sizefactor = 1.0;

//all the numbers below are in mm, including translations


    {   //flange/base
        nlength = 330.20 * sizefactor;
        nwidth= 189.69 * sizefactor;
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
        width= 161.59 * sizefactor;
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
        iwidth= 151.05 * sizefactor;
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
   
