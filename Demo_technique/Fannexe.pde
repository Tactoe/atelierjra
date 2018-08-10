
//Fonctions de dessin

void  drawLine(int startx, int starty, int finishx, int finishy, color col)
{
  stroke(col);
  line(startx, starty, finishx, finishy);
}

void  drawSquare(int startx, int starty, int widthx, int widthy, color col)
{
  noStroke();
  fill(col);
  rect(startx, starty, widthx, widthy);
}

void  drawCircle(int startx, int starty, int widthx, int widthy, color col)
{
  noStroke();
  fill(col);
  ellipse(startx, starty, widthx, widthy);
}

void  drawBox()
{
  //dessine un carre a l'aide de 4 lignes 
  drawLine(200, 100, 1000, 100, red);
  drawLine(200, 100, 200, 700, green);
  drawLine(1000, 100, 1000, 700, blue);
  drawLine(200, 700, 1000, 700, color(200,  10, 240));
}

//Fonctions pour le palier 3

void printSquares()
{
  drawSquare(width - width / 5, 0, width / 5, 100, red);
  drawSquare(width - width / 5, 100, width / 5, 100, blue);
  drawSquare(width - width / 5, 200, width / 5, 100, green);
}

boolean mouseIsInBox(int xmin, int ymin, int xmax, int ymax)//Regarde si la position de la souris est a l'interieur d'une boite de xmax pixels de large et ymin pixels de haut  
{                                                           //dont le coin haut gauche est situe a la position (x = xmin y = ymin) 
  if (mouseX >= xmin && mouseX <= xmax && mouseY >= ymin && mouseY <= ymax)
    return (true);
  else
    return (false);
}