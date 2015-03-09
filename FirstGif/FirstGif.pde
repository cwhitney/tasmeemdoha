import gifAnimation.*;

GifMaker gifExport;
boolean saveFrame;
PImage img;
PGraphics canvas;

int y = 0;

void setup() {
  size( 500, 500 );
  canvas = createGraphics(500, 500);
  
  frameRate(12);
  
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);
  gifExport.setTransparent(0,0,0);
  
  saveFrame = false;
  noStroke();
  
  img = loadImage("processing.png");
}

void draw(){
  background( 0 );
 
  
  fill(255);
  rect(0, y, 500, 20);
  rect(y, 0, 20, 500);
  
  y = y + 20;
  
  delay(10);
  gifExport.setDelay( 1000 / 12 );
  gifExport.addFrame();
}

void keyReleased() {
  if( key == 'e' ){
   println("Exported gif!");
   gifExport.finish();
 }
}
