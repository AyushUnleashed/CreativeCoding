import com.hamoid.*;

PImage img;

void setup()
{
   int h = 808;
   int w=1080;
    size(1080,1080,P3D);
    img= loadImage("img1.jpg");
    img.resize(1080,1080);
}

void draw()
{
background(#ffffff);
fill(0);
noStroke(); 

float tiles = 500;
float ytiles = tiles*1;
float tileSize = width/tiles;

push();
translate(width/2,height/2);

for (int x=0; x<=tiles;x++)
{
    for (int y=0; y<=ytiles;y++)
    {

    color c = img.get(int(x*tileSize),int(y*tileSize));
    float b = map(brightness(c),0,255,1,0);
    float iB= map (brightness(c), 0,255,0,1); 
    float z =map (b,0,1,-100, 100);

    push();
    float wave = -sin(radians(frameCount));
    float val = map(wave,-1,1,0,800);
  
    float p=iB*4*val;
    translate(x*tileSize-width/2,y*tileSize-height/2,p);
    fill(c);
    ellipse(0, 0,tileSize, tileSize);
    pop();
    }
} 

pop();

saveFrame("output4/indianMap_######.png");

}
