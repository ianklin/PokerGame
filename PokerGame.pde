import java.util.*;
import java.io.File;

PImage[] pics = new PImage[52];
Deck a;
void setup(){
  size(800,800);
  String folderPath = sketchPath()+"/cards";
  PImage dia = loadImage(folderPath + "/diamonds-cards.jpg");
  for (int i = 0; i < 13; i++){
    pics[i] = dia.get(1 + i * 73, 0, 73, 96);
  }
  PImage club = loadImage(folderPath + "/clubs-cards.jpg");
  for (int i = 0; i < 13; i++){
    pics[i+13] = club.get(1 + i * 73, 0, 73, 96);
  }
  PImage heart = loadImage(folderPath + "/hearts-cards.jpg");
  for (int i = 0; i < 13; i++){
    pics[i+26] = heart.get(1 + i * 73, 0, 73, 96);
  }
  PImage spade = loadImage(folderPath + "/spades-cards.jpg");
  for (int i = 0; i < 13; i++){
    pics[i+39] = spade.get(1 + i * 73, 0, 73, 96);
  }
  a = new Deck();
}

void draw(){
  a.revealDeck();
}
