import java.util.*;
import java.io.File;
enum GameStates{
  PASSCARDS,
  FLOP,
  TURN,
  RIVER,
  RESULTS,
  OPTIONS
}
GameStates currentState = GameStates.PASSCARDS;
PImage[] pics = new PImage[52];
Deck a;
Hand player1;
GameTable table;
Button call;
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
  a.shuffle();
  player1 = new Hand();
  table = new GameTable();
  call = new Button("Call", 600, 700);
}

public void mouseCheck(){
  if (MouseInput.mouseClicked) {
    MouseInput.mouseClicked = false;
  }
  if (mousePressed == true && MouseInput.mouseHeldDown == false){
    MouseInput.mouseClicked = true;
    MouseInput.mouseHeldDown = true;
  }
  if (mousePressed == false && MouseInput.mouseHeldDown == true){
    MouseInput.mouseHeldDown = false;
  }
}

void draw(){
  mouseCheck();
  switch(currentState){
    case PASSCARDS:
      Card card1 = a.passCard();
      Card card2 = a.passCard();
      player1.getCards(card1, card2);
      player1.goTo(330,700);
      currentState = GameStates.FLOP;
      break;
    case FLOP:
      table.flop(a.passCard(), a.passCard(), a.passCard());
      currentState = GameStates.TURN;
      break;
    case TURN:
      table.turn(a.passCard());
      currentState = GameStates.RIVER;
      break;
    case RIVER:
      table.river(a.passCard());
      currentState = GameStates.RESULTS;
      break; 
    case RESULTS:
      break;
    case OPTIONS:
      call.show();
      break;
  }
  table.displayAll();
  player1.show();
}
