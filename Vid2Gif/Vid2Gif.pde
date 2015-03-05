import gifAnimation.*;
import processing.video.*;

int OUTPUT_FRAMERATE = 30;    // CHANGE THIS TO CHANGE THE SPEED OF YOUR GIF. A HIGER NUMBER = SLOWER GIF. 30 FPS SHOULD BE NORMAL
 
Movie mov;
GifMaker gifExport;

float timestep;
int curStep;
boolean bSaved;
float gifScale = 0.5;
float gifW = 720;
float gifH = 1280;

void setup(){
  size(int(gifW * gifScale), int(gifH * gifScale), OPENGL);
  bSaved = false;
  
  mov = new Movie(this, "IMG_3076.mov");
  mov.play();
  mov.pause();
  
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);
  
  timestep = mov.duration() / (OUTPUT_FRAMERATE);
  curStep = 0;
}

void draw() {
  float maxWidth = mov.height * gifScale;
  float maxHeight = mov.width * gifScale;
  
  float ww = mov.width;
  float hh = mov.height;
  
  float ratio = maxHeight / ww;  // if you filmed horizontally
  
  pushMatrix();
    scale( ratio , ratio  );
    translate( hh * 0.5, ww * 0.5 );
    rotate( 3.1415926 / 2);
    translate( ww *-0.5, hh * -0.5 );

    mov.jump( timestep * curStep );
    mov.play();
    mov.pause();

    if (mov.available()) {
      mov.read();
      ++curStep;
      
      println("Frame: ", curStep );
      
      image(mov, 0, 0, ww, hh );
      
      gifExport.addFrame();
      
      if( mov.time() >= mov.duration() ){
        if( !bSaved ){
          bSaved = true;
          gifExport.finish();
          println("Done! Exported Gif");
        }
      }
    }
  popMatrix();
}
