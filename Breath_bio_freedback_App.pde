// class for winter button feature 
Breather[] breathers = new Breather[100];

// analysing voice visualisation
import processing.sound.*;
AudioIn input;
Amplitude analyser;

// buttons
import controlP5.*;
ControlP5 gui;

// music track library import
import ddf.minim.*;
Minim minim;
AudioPlayer player;

float amount;
       
float r = 0;
float line = 0;

int num =20;
float step, sz, offSet, theta, angle;

int season = 0;

float t = 0.0;  

int colors;
int type;

float shift =  10;
float amplitude = 100; 
float frequency = 3.0/62; 
int numPoints = 1000; 


void setup()
{
  gui = new ControlP5(this); 
  
  // winter button 
  for (int i = 0; i < breathers.length; i++) {
    breathers[i] = new Breather(); 
  }
     
  // analysing voice visualisation
  input = new AudioIn(this, 0);
  input.start();
  analyser = new Amplitude(this);
  analyser.input(input);
  
   // uploaded music file to data file to link with code
   minim = new Minim(this);
   player = minim.loadFile("Breath.mp3");
  
  size(1050, 1000);
    background(233);
      step = 22;
      
  
   gui.addButton("Summer")
     .setValue(0)
     .setPosition(50,800)
     .setSize(200,19)
     ;
     
  gui.addButton("Autumn")
     .setValue(0)
     .setPosition(300,800)
     .setSize(200,19)
     ;
     
      gui.addButton("Winter")
     .setValue(0)
     .setPosition(550,800)
     .setSize(200,19)
     ;
     
      gui.addButton("Spring")
     .setValue(0)
     .setPosition(800,800)
     .setSize(200,19)
     ;
     
      gui.addButton("Clear")
     .setValue(0)
     .setPosition(450,900)
     .setSize(200,19)
     ;
     
     gui.addButton("Breath")
     .setValue(0)
     .setPosition(450,700)
     .setSize(200,19)
     ;
    
}

void Summer()
{
 season = 1;
 background(233);
 step = 50;
}
void Autumn()
{
  season = 2;  
  background(233);
  float r = 0;
  float line = 0;
}

void Winter()
{
 season = 3;
}
void Spring()
{
 season = 4;
}
void Breath()
{
 season = 5;

}
void Clear()
{
 season = 0;
}

void draw()
{
  // breathing visualisation 
 blendMode(BLEND);
  if(type == 0) {
    background(255);
    blendMode(EXCLUSION);
    color(0,0,0);
    
  } else {
    background(0);
    blendMode(SCREEN);
    color(72,61,139);
  }
  noFill();
  strokeWeight(20);
  for(int i = 0; i < 3; i++) {
    stroke(95,158,160);
    beginShape();
    for(int w = -20; w < width + 20; w += 5) {
      int h = height / 2;
      h += 200 * sin(w * 0.03 + frameCount * 0.07 + i * TWO_PI / 3) * pow(abs(sin(w * 0.001 + frameCount * 0.02)), 5);
      curveVertex(w, h);
    }    
    endShape();
  }

if (season == 0) {
   background(255); 
}
else if ( season == 1) {
  background(255);
  translate(width/2, height*.55);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke(60);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(1, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .035;
  
} 
else if(season == 2) {
  background(255);
  float x = r * cos(line);
  float y = r * sin(line);
 stroke(100);
  fill(0);
  ellipse(x+width/2, y+height/2, 50, 50); 
  line += 0.05;
  r += 0.2;
  
}
else if (season == 3) {
  background(255);
  for (int i = 0; i < breathers.length; i++) {
    breathers[i].breath();
    breathers[i].display();
    }
    
  }

else if (season == 4) {
  background(255);
  fill(100);
  stroke(60);

  float x = 0;
  float y = 0;
  float angle = width/numPoints;
  
  beginShape();
  for (int i = 0; i < numPoints; i++) 
  {
    x = angle*i;
    y = sin(x*frequency+shift)* amplitude;
    vertex(x, y);
  }
  endShape();

  shift -= .09;
}
 
  else if (season == 5) {
  
    fill(100);
  stroke(60);
    amount = (float) mouseX;
  float sinVal = sin(frameCount/amount);
  float size = map(sinVal, -1, 1, 0, 100);
  ellipse(750,150,size,size);
}

  // analysing voice visualisation 
  float vol = analyser.analyze();
  fill(100);
  stroke(60);
  ellipse(900, 100, 100+vol*1500, 100+vol*1500);
  text("YOUR BREATH",860, 200);
  
 
  // music track button 1
  rect(100,100,50,50);
  text("PLAY",110, 180);
  
  // music track button 2
  rect(200,100,50,50);
  text("PAUSE",210, 180);
  
}

void mousePressed()
{
   // Constraints for the button's feature to work (play and rewind music track) 
  if (mouseX > 50 && mouseX < 150 && mouseY > 50 && mouseY < 150){
    player.rewind();
    player.play();
    
  }
    
  // Constraints for the button's feature to work (stop and rewind music track)
 else if (mouseX > 150 && mouseX < 250 && mouseY > 50 && mouseY < 150){
    player.pause();
  }
  
} 
  