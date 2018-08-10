color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color bigCircleColor = red;
color smallCircleColor = green;
PImage img;

void setup() {
  size(1200, 800);
  strokeWeight(3);
  imageMode(CENTER);
  img = loadImage("etoile.png");
}

void draw()
{
  background(204);
  drawBox();
  image(img, width / 2, height / 2);
  // trace une ligne rouge entre le milieu de l'ecran et la position de la souris
  drawLine(width / 2, height / 2, mouseX, mouseY, red);
  
  // trace une ligne bleue entre le coin bas droit de l'ecran et la position (t - 1) de la souris
  drawLine(width, height, pmouseX, pmouseY, blue);
  
  if (key == 'b' || key == 'B') 
  {
    bigCircleColor = blue;
  }
  if (key == 'r' || key == 'R')
  {
    bigCircleColor = red;
  }
  if (mouseIsInBox(200, 100, 1000, 700))
  {
    drawCircle(pmouseX, pmouseY, 75, 75, bigCircleColor);
  }
  if (mousePressed == false)
  {
    drawCircle(mouseX, mouseY, 50, 50, smallCircleColor);
  }
}