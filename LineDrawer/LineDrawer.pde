PVector lastPosition;
boolean mouseDown;

void setup(){
  size(720, 480);
  background(255);
  
  mouseDown = false;
  
  lastPosition = new PVector(0, 0);
}

void mousePressed() {
  mouseDown = true;
  lastPosition.set( mouseX, mouseY );
}

void mouseReleased() {
  mouseDown = false;
}

void draw(){
  if( mouseDown == true ){
    line( lastPosition.x, lastPosition.y, mouseX, mouseY);
  }else{
   //  background(255);    
  }
  
  lastPosition.set( mouseX, mouseY );
}

