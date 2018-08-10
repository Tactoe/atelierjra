color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color brushColor = red;
boolean rainbowMode = false;
int brushSize;
String brushType;
PImage img;

void setup() {
  img = loadImage("pentacle.png");
  imageMode(CENTER);
  brushType = "normal";
  brushSize = 5;
  background(255);
  size(1200, 800);
  strokeWeight(brushSize);
}

/*
 Processing a une fonction keyReleased() built-in et il serait plus propre de l'utiliser,
 avec keyPressed il active pour chaque frame ou la touche est maintenue, du coup ca bourrine un peu
 (en moyenne 3 "changed color" print en appuyant rapidement).
 Mais j'avais peur que ce soit trop prise de tete et keyPressed fonctionne bien dans le cadre
 de cet exercice, donc ca passe de faire comme ca.
*/

void setColor()
{
  //Palier 2
  if (keyPressed) 
  {
  if (key == 'b' || key == 'B')
    brushColor = blue;
  if (key == 'r' || key == 'R')
    brushColor = red;
    if (key == 'g' || key == 'G')
    brushColor = green;
    if (key == 'm' || key == 'M')
    brushColor = color(255, 0, 255);
    //palier 4
    if (key == '1')
      brushType = "normal";
    if (key == '2')
      brushType = "flower";
    if (key == '3')
      brushType = "pentacle";
    print("changed color");
  }
  
  //Palier 3
  if (mousePressed)
  {
    if (mouseIsInBox(width - width / 5, 0, width, 100))
      brushColor = red;
    if (mouseIsInBox(width - width / 5, 100, width, 200))
      brushColor = blue;
    if (mouseIsInBox(width - width / 5, 200, width, 300))
      brushColor = green;
    if (mouseIsInBox(width - width / 5, 300, width, 400))
      brushColor = color(255, 0, 255);
  }
  
 
}

void erase()
{
  if (keyPressed)
  {
    if (key == 'e' || key == 'E')
      background(255);
    if (key == 'w' || key == 'W')
      brushColor = color(255);
  }
}

void setBrushSize()
{
  if (keyPressed)
  {
    if (key == '+')
      brushSize++;
    else if (key == '-' && brushSize > 0)
      brushSize--;
    strokeWeight(brushSize);
  }
}

void draw()
{
  printSquares();
  setColor();
  erase();
  setBrushSize();
  drawSquare(width - width / 5, 300, width / 5, 100, color(255, 0, 255));
  if (mousePressed)
  {
    color col;
    
    if (rainbowMode == true)
      col = color(random(0, 255), random(0, 255), random(0, 255));
    else
      col = brushColor;
      
    switch (brushType)
    {
      case "normal":
        drawLine(pmouseX, pmouseY, mouseX, mouseY, col);
        break;
        
      case "flower":
        drawLine(pmouseX, pmouseY, mouseX, mouseY, col);
        drawCircle(mouseX + brushSize, mouseY, brushSize * 2, brushSize, col);
        drawCircle(mouseX - brushSize, mouseY, brushSize * 2, brushSize, col);
        drawCircle(mouseX , mouseY + brushSize, brushSize, brushSize * 2, col);
        drawCircle(mouseX , mouseY - brushSize, brushSize, brushSize * 2, col);
        break;
        
      case "pentacle":
        image(img, mouseX, mouseY);
        break;
    }
  }
}