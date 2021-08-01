int x=100, y=400, z = 422, dz = 4, a = 423, da = 6, niveau = 1, death = 0;
boolean right, left, up, down, flag, coin;
PImage level ; 

void setup() {
  size(850, 600); // taille de la fenetre
  right = left = up = down = flag  = false; //mouvements
  coin = false; //mise en place de la pièce
  stroke(2);
  frameRate(60);
  level = loadImage("level 1.png");
  level.resize(850, 600);
}

void draw() {  
  z=z+dz; //mouvement des ellipses 2 et 4
  a=a-da; //mouvement des ellipses 1,3 et 5

  if (niveau == 1 ) { //variable niveau
    image(level, 0, 0); 

    textSize(60); 
    textAlign(TOP); 
    text("LEVEL 1", 275, 60);
    textAlign(BOTTOM); 
    text("Deaths="+death, 60, 550);

    stroke(2); // rebords des cercles
    fill(10, 10, 250);  // couleur des cercles
    ellipse(a, 204, 20, 20);  //cercles ennemis
    ellipse(z, 252, 20, 20);
    ellipse(a, 300, 20, 20);
    ellipse(z, 348, 20, 20);
    ellipse(a, 396, 20, 20);
    if (!coin) { 
      fill(250, 250, 10); //pièce à récupérer
      ellipse(425, 300, 16, 16);
    }
    if (coin) { 
      fill(250, 250, 10); //pièce récupérée
      ellipse(565, 100, 25, 25);
    }

    if ( z <= 275 || z >= 571  ) {
      dz = -dz;
    }  // va et viens des cercles 
    if ( a >= 571 || a <= 275  ) {
      da = -da;
    }  // idem
  }

  if (right) { 
    flag = false;
    for (int i=0; i<=25; i++) {
      if (level.get(x+26, y+i) == #000000) // détection du mur droit
        flag = true;
    }
    if (!flag) x=x+2;
  }

  if (left) {
    flag = false;
    for (int i=0; i<=25; i++) {
      if (level.get(x-1, y+i) == #000000) // détection mur gauche
        flag = true;
    }
    if (!flag) x=x-2;
  }

  if (up) {
    flag = false;
    for (int i=0; i<=25; i++) {
      if (level.get(x+i, y-1) == #000000) // détection mur haut
        flag = true;
    }
    if (!flag) y=y-2;
  }

  if (down) {
    flag = false;
    for (int i=0; i<=25; i++) {
      if (level.get(x+i, y+26) == #000000) // détection mur bas
        flag = true;
    }
    if (!flag) y=y+2;
  }

  // détection de collision avec la première bille
  if (y+25>204-10 & y+25<204 &( sqrt( sq(x+25-a)+sq(y+25-204))<10 ||    sqrt( sq(x-a)+sq(y+25-204)) <10) ) //si la distance carré/bille est inférieure à son rayon...
  {
    x = 100;//retour au départ
    y = 400; 
    death = death +1;//ajout d'une mort au compteur
    rect(x, y, 25, 25);
    coin = false;//replacement de la pièce
  }
  if (y+25>=204 & y<=204 &(abs(x+25-a)<10 || abs(x-a)<10)) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  if (y>204 & y<204+10 &( sqrt( sq(x+25-a)+sq(y-204))<10 ||    sqrt( sq(x-a)+sq(y-204)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  // détection de collision avec la deuxième bille
  if (y+25>252-10 & y+25<252 &( sqrt( sq(x+25-z)+sq(y+25-252))<10 ||    sqrt( sq(x-z)+sq(y+25-252)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  }
  if (y+25>=252 & y<=252 &(abs(x+25-z)<10 || abs(x-z)<10)) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  if (y>252 & y<252+10 &( sqrt( sq(x+25-z)+sq(y-252))<10 ||    sqrt( sq(x-z)+sq(y-252)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  // détection de collision avec la troisième bille
  if (y+25>300-10 & y+25<300 &( sqrt( sq(x+25-a)+sq(y+25-300))<10 ||    sqrt( sq(x-a)+sq(y+25-300)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  }
  if (y+25>=300 & y<=300 &(abs(x+25-a)<10 || abs(x-a)<10)) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  if (y>300 & y<300+10 &( sqrt( sq(x+25-a)+sq(y-300))<10 ||    sqrt( sq(x-a)+sq(y-300)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  // détection de collision avec la quatrième bille
  if (y+25>348-10 & y+25<348 &( sqrt( sq(x+25-z)+sq(y+25-348))<10 ||    sqrt( sq(x-z)+sq(y+25-348)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  }
  if (y+25>=348 & y<=348 &(abs(x+25-z)<10 || abs(x-z)<10)) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  if (y>348 & y<348+10 &( sqrt( sq(x+25-z)+sq(y-348))<10 ||    sqrt( sq(x-z)+sq(y-348)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  // détection de collision avec la cinquième bille
  if (y+25>396-10 & y+25<396 &( sqrt( sq(x+25-a)+sq(y+25-396))<10 ||    sqrt( sq(x-a)+sq(y+25-396)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  }
  if (y+25>=396 & y<=396 &(abs(x+25-a)<10 || abs(x-a)<10)) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 
  if (y>396 & y<396+10 &( sqrt( sq(x+25-a)+sq(y-396))<10 ||  sqrt( sq(x-a)+sq(y-396)) <10) ) 
  {
    x = 100;
    y = 400; 
    death = death +1;
    rect(x, y, 25, 25);
    coin = false;
  } 

  // détection de collision avec la pièce
  if (y+25>300-8 & y+25<300 &( sqrt( sq(x+25-425)+sq(y+25-300))<8 ||    sqrt( sq(x-425)+sq(y+25-300)) <8) ) 
  {
    coin = true;
  }

  if (y+25>=300 & y<=300 &(abs(x+25-425)<8 || abs(x-425)<8)) 
  {
    coin = true;
  } 

  if (y>300 & y<300+8 &( sqrt( sq(x+25-425)+sq(y-300))<8 ||  sqrt( sq(x-425)+sq(y-300)) <8) ) 
  {
    coin = true;
  }

  for (int i=0; i<=25; i++) { //si on arrive à la fin sans avoir pris la pièce
    if (level.get(x-1, y+i) == color(141, 241, 141)) {
      textSize(20);
      text("get the coin to win", 550, 50);
    }

    if (level.get(x-1, y+i) == color(141, 241, 141) && coin) {//si l'on gagne (arrivée+pièce)
      niveau = 2 ;
      x = 100;
      y = 300;
    }
  }

  fill(255, 0, 0);
  rect(x, y, 25, 25);

  if (niveau == 2) {//écran de fin
    fill(255);
    rect(0, 0, 850, 600);

    textSize(60);
    fill(0);
    text("Congratulations!", 200, height/2-30);
    text("You did it!", 270, height/2+30);
  }
}
void keyPressed() {
  if (keyCode == RIGHT) { 
    right = true;
  }
  if (keyCode == LEFT) { 
    left = true;
  }
  if (keyCode == UP) { 
    up = true;
  }
  if (keyCode == DOWN) { 
    down = true;
  }
}

void keyReleased() {
  if (keyCode == RIGHT) { 
    right = false;
  }
  if (keyCode == LEFT) { 
    left = false;
  }
  if (keyCode == UP) { 
    up = false;
  }
  if (keyCode == DOWN) { 
    down = false;
  }
}
