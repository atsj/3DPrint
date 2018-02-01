//This file increases the "lip" size to account for thicker ceiling.

$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

//Currently nlength (330.2mm) * sizefactor (0.61515) = 203.123mm (7.997in).
//Currently nwidth (189.69mm) * sizefactor (0/61515) = 116.688mm (4.595in).

// Variables.
botLength    = 250;
botWidth     = 200;
botHeight    = 1;
cornerRadius = 5;

lipOffset    = 12;
lipThickness = 3;
lipHeight    = 18;

// Bottom.
drawBox( botLength, botWidth, botHeight, cornerRadius );

// Lip.
difference()
{
  translate( [ 0, 0, ( botHeight + lipHeight ) / 2 ] )
    color( [ 1, 0, 0 ] ) drawBox( botLength - lipOffset, botWidth - lipOffset, lipHeight, cornerRadius );

  translate( [ 0, 0, ( botHeight + lipHeight ) / 2 ] )
    color( [ 0, 1, 0 ] ) drawBox( botLength - lipOffset - lipThickness, botWidth - lipOffset - lipThickness, lipHeight + 2, cornerRadius );
}

// Flanges.
flangeRadius = 1.5;
flangeX      = ( botWidth - lipOffset - lipThickness / 2 ) / 2;
drawFlange( -flangeX, flangeRadius );
drawFlange(  flangeX, flangeRadius );

module drawBox( length, width, height, cornerRadius )
{
  hull()
  {
    // Upper left rounded edge.
    translate( [ ( width - cornerRadius * 2 ) / 2, ( -length + cornerRadius * 2 ) / 2, -height / 2 ] )
      cylinder( height, cornerRadius, cornerRadius );
    
    // Upper right rounded edge.
    translate( [ ( -width + cornerRadius * 2 ) / 2, ( -length + cornerRadius * 2 ) / 2, -height / 2 ] )
      cylinder( height, cornerRadius, cornerRadius );
    
    // Lower left rounded edge.
    translate( [ ( width - cornerRadius * 2 ) / 2, ( length - cornerRadius * 2 ) / 2, -height / 2 ] )
      cylinder( height, cornerRadius, cornerRadius );
    
    // Lower right rounded edge.
    translate( [ ( -width + cornerRadius * 2 ) / 2, ( length - cornerRadius * 2 ) / 2, -height / 2 ] )
      cylinder( height, cornerRadius, cornerRadius );
  }
}

module drawFlange( position, radius)
{
  rotate( [ -90, 0, 0 ] ) 
    translate( [ position, -( botHeight / 2 + lipHeight + radius - 0.25 ), 0 ] ) 
      cylinder( botLength / 1.5, radius, radius, true );
}
