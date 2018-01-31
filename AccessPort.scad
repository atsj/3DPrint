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
        
       
        
*/

$fn=200;

//note, change interior translation parameter when changing sizefactor
sizefactor = 1.0;

    {   //flange/base
        nlength = 94 * sizefactor;
        nwidth= 54 * sizefactor;
        nheight = 2.5 * sizefactor;
        nradius = 10 * sizefactor;
        ndRadius = 2*nradius;

        translate([-4, -4, 0]) {
            minkowski() {
                cube(size=[nwidth-ndRadius,nlength-ndRadius,        nheight]);
                cylinder(r=nradius, h=0.01);
            }
        }
    }


difference() {
    {   //outer rim (inserts into headliner)
        length = 86 * sizefactor;
        width= 46 * sizefactor;
        height = 7 * sizefactor;
        radius = 10 * sizefactor;
        dRadius = 2*radius;

        translate([0, 0, 0]) {
            minkowski() {
                cube(size=[width-dRadius,length-dRadius, height]);
                cylinder(r=radius, h=0.01);
            }
        }   
    };

       

     {  //interior (to remove)
        ilength = 84 * sizefactor;
        iwidth= 43 * sizefactor;
        iheight = 7 * sizefactor;
        iradius = 10 * sizefactor;
        idRadius = 2*iradius;
        translate([1.5, 1, 3]){
            minkowski() {
                cube(size=[iwidth-idRadius,ilength-idRadius,        iheight]);
                cylinder(r=iradius, h=0.01);
            }
        }
    };
}
   
//difference(){
//    outside();
//    inside();

//}
/*
difference() {
    cube(30, center=true);
    sphere(20);
}
*/