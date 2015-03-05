class Line {
  PVector p1, p2; 
}

ArrayList<Line> lines = new ArrayList<Line>();
ArrayList<PVector> crosses = new ArrayList<PVector>();

void setup(){
  size( 800, 600);
  smooth();
  
  background(255);
}

void mousePressed(){
  lines.add( createRandomLine() );
  
  doDraw();
}

Line createRandomLine() {
  Line myLine = new Line();

  int randSide = floor(random(0,4));
  if( randSide == 0 ){
    myLine.p1 = new PVector( random(0, width), 0);    
  }else if( randSide == 1 ){
    myLine.p1 = new PVector( width, random(0, height) );    
  }else if( randSide == 2 ){
    myLine.p1 = new PVector( random(0, width), height);    
  }else if( randSide == 3 ){
    myLine.p1 = new PVector( 0, random(0, height) );    
  }
  
  int randSide2 = floor( random(0,4) );
  while( randSide2 == randSide ){
    randSide2 = floor( random(0,4) );
  }
  
  if( randSide2 == 0 ){
    myLine.p2 = new PVector( random(0, width), 0);    
  }else if( randSide2 == 1 ){
    myLine.p2 = new PVector( width, random(0, height) );    
  }else if( randSide2 == 2 ){
    myLine.p2 = new PVector( random(0, width), height);    
  }else if( randSide2 == 3 ){
    myLine.p2 = new PVector( 0, random(0, height) );    
  }

  return myLine;
}

void doDraw(){
  background(255);
  crosses.clear();
  
  fill( color(255) );
  for( int i=0; i<lines.size(); i++ ){
    Line l = lines.get(i);
    line( l.p1.x, l.p1.y, l.p2.x, l.p2.y ); 
  }
  
  fill( color(255, 0, 0) );
  noStroke();
  for( int i=0; i<crosses.size(); i++ ){
    ellipse( crosses.get(i).x, crosses.get(i).y, 10, 10);
  }
  stroke(1);
  
}

void draw(){
  
}
