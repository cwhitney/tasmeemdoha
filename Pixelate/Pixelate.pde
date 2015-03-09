PImage myImage;

void setup(){
  myImage = loadImage( "newinc.jpg" );
  
  
  size( myImage.width, myImage.height);
}


void draw(){
  
  int sqSize = 1;
  sqSize = sqSize + (mouseX / 10);
 
  
  for( int y=0; y < myImage.height; y+=sqSize ){
    for( int x=0; x < myImage.width; x+=sqSize ){
      color c1 = myImage.get( x, y );
      fill( c1 );
      noStroke();
      rect(x, y, sqSize, sqSize);  
    } 

  }
  

  
  //image( myImage, 0, 0 );  
}
