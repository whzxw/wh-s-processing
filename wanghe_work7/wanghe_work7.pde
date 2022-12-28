import processing.pdf.*;

PFont font;
PGraphics pg;

boolean savePDF;

void setup(){
  font = createFont("Avenir-HeavyOblique",600);
  size(1000,600,P2D);
  pg = createGraphics(800,800,P2D);
}

void draw(){
 background(0);
 
 
 
 pg.beginDraw();
 pg.background(0);
 pg.fill(255,148,224);
 pg.textFont(font);
 pg.textSize(130);
 pg.pushMatrix();
 pg.translate(width/2+40,height/2-115);
 pg.textAlign(CENTER,CENTER);
 pg.text("HELLO!",0,0);
 pg.popMatrix();
 pg.endDraw();
 
 int tilesX=16;
 int tilesY=8;
 
 int tileW = int(width/tilesX);
 int tileH = int(height/tilesY);
 
 
 for(int y=0; y<tilesY ; y++){
  for(int x=0; x<tilesX ; x++){
  
    int wave =int(sin(frameCount*0.05+(x*y)*0.07)*100);
    
    int sx = x*tileW +wave;
    int sy = y*tileH;
    int sw = tileW;
    int sh = tileH;
    
    int dx = x*tileW;
    int dy = y*tileH;
    int dw =tileW;
    int dh =tileH;
    
    copy(pg,sx,sy,sw,sh,dx,dy,dw,dh);
     
     if(savePDF){
  beginRecord(PDF,"output/Line.pdf");
}
 
 if(savePDF){
 endRecord();
 savePDF= false;
 }
    
  }
 }
}

void keyPressed(){
 if(key =='s') savePDF = true;
}
