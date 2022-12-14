PImage detach;
int xstep=10;
int ystep=10;
int maxSize=20;
//int maxBri=180;
float maxBri=255;

void setup(){
size(830,1000);
frameRate(10);
noStroke();
textAlign(CENTER,CENTER);
//detach=loadImage("AF.JPG");
detach=loadImage("IMG_7726.jpg");
detach.resize(0,height);
}

void draw() {
  background(255);
  xstep=int(map(mouseX,0,detach.width,2,16));
  ystep=int(map(mouseY,0,detach.height,2,16));

for(int i=0;i<detach.width;i+=xstep){
for(int j=0;j<detach.height;j+=ystep){
color col=detach.get(i,j);
float bri=brightness(col);

if(bri<maxBri){
float size=map(bri,0,maxBri,maxSize,0);
fill(col);
//textSize(size);
//text("*",i,j);
//rect(i,j,size,size);
circle(i,j,size);
}
}
}
}

void mouseWheel(MouseEvent event){
  if(keyPressed){
  maxBri-=event.getCount();
}else{
 maxSize-=event.getCount();
 }
}
