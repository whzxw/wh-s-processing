PImage detach;
int xstep=10; 
int ystep=10; 
int maxSize=20; 
//int maxBri=180; 
float maxBri=255;

void setup() {
size (1000, 1000) ; 
frameRate (10) ;
noStroke ();
textAlign (CENTER, CENTER) ;
//detach= load Image (" AF. jpg");
detach=loadImage (" leslie.JPG") ;
detach. resize(0, height) ;

void draw(){
background(255) ; 
xstep=int (map (mouseX, 0, detach. width, 2,16));
ystep=int (map (mouseY, 0, detach. height, 2,16));
for (int i=0; i<detach. width; i+=xstep) {
for (int j=0; j<detach. height; j+=ystep){
color col=detach. get(i, j);
float bri=brightness(col);

if (bri<maxBri) {
float size=map(bri, 0, maxBri, maxSize,0)
fill(col);
//textSize(size) ;
//text("*", i, j) ;
//rect(i, j, size, size) ;
circle(i, j, size) ;
}
}
}

textSize (40) ;
fill(0) ;
text(" xstep: "+xstep, 850, 100) ; 
text ("ystep: "+ystep, 850, 200) ; 
text("max size: ", 850, 400) ; 
text (maxSize, 850, 450) ;
text("max bri: ", 850, 550) ; 
text (maxBri, 850, 600) ;
}

void mouseWheel (MouseEvent event) {
if (keyPressed) {
maxBri-=event. getCount () ;
}else{
maxSize-=event. getCount () ;
}
}
