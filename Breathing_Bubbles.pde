
class Breather {   

  float x, y;
  float rad;
  float theta;  
  float dtheta;

  Breather() { 
    x = random(width);
    y = random(height);  
    rad = random(6, 24);
    theta = random(PI);  
    dtheta = random(0.01, 0.1);
  }   

  void breath() {
    theta += dtheta;
  }   

  void display() { 
    float r = rad + rad * (sin(theta) + 1);
    // Display circle
    fill(175, 100);
    stroke(1);
    ellipse(x, y, r, r);
  }
}   