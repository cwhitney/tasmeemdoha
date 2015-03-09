PImage myImage;

void setup(){
  myImage = loadImage( "newinc.jpg" );
  
  size( myImage.width, myImage.height, P3D);
}


void draw(){
  background( 0 );
  
  int sqSize = 20;
  
  for( int y=0; y < myImage.width; y+=sqSize ){
    for( int x=0; x < myImage.width; x+=sqSize ){
      color c1 = myImage.get( x, y );
      fill( c1 );
      noStroke();
      
      pushMatrix();
      int translateAmt = floor( sin( (float)x / (float)myImage.width * 3.14  + millis() / 1000.0 * 2.0 ) * mouseY );
      
        translate( 0, 0, translateAmt );
        rect(x, y, sqSize, sqSize);
        
        
      popMatrix();  
    } 

  }
  
}
