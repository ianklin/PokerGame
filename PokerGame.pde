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
int stateNum = 0;
GameStates currentState = GameStates.PASSCARDS;
PImage[] pics = new PImage[52];
PImage hiddenCard;
Deck a;
Hand player1;
Hand CPU1;
Hand CPU2;
Hand CPU3;
GameTable table;
Button addMoney;
Button fold;
Button replay;
Button add10;
Button add100;
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
  hiddenCard = loadImage(folderPath + "/blueback.jpg");
  a = new Deck();
  a.shuffle();
  //a.revealDeck();
  player1 = new Hand();
  CPU1 = new Hand();
  CPU2 = new Hand();
  CPU3 = new Hand();
  table = new GameTable();
  addMoney = new Button("Call", 550, 700, 100, 25);
  add10 = new Button("Add $10", 660, 700, 100, 25);
  add100 = new Button("Add $100", 660, 730, 100, 25);
  fold = new Button("Fold", 550, 730, 100, 25);
  replay = new Button("Play Again", 350, 600, 150, 37);
  player1.goTo(330,700);
  CPU1.goTo(0,350);
  CPU2.goTo(330,0);
  CPU3.goTo(660,350);
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
  background(255);
  textSize(12);
  mouseCheck();
  switch(currentState){
    case PASSCARDS:
      a.reset();
      stateNum = 0;
      table.reset();
      //Card card1 = new Card(pics[0], 1, 0, 52);
      //Card card2 = new Card(pics[1], 2, 0, 4);
      //player1.getCards(card1, card2);
      player1.getCards(a.passCard(), a.passCard());
      CPU1.getCards(a.passCard(), a.passCard());
      CPU2.getCards(a.passCard(), a.passCard());
      CPU3.getCards(a.passCard(), a.passCard());
      currentState = GameStates.OPTIONS;
      CPU1.money -= 10;
      CPU2.money -= 10;
      CPU3.money -= 10;
      table.pot += 30;
      CPU1.showHidden();
      CPU2.showHidden();
      CPU3.showHidden();
      break;
    case FLOP:
      table.flop(a.passCard(), a.passCard(), a.passCard());
      //Card card3 = new Card(pics[2], 3, 0, 8);
      //Card card4 = new Card(pics[3], 4, 0, 12);
      //Card card5 = new Card(pics[4], 5, 0, 16);
      //table.flop(card3, card4, card5);
      currentState = GameStates.OPTIONS;
      table.currentBet += 10 * floor(random(0,11));
      table.currentBet += 10 * floor(random(0,11));
      table.currentBet += 10 * floor(random(0,11));
      CPU1.showHidden();
      CPU2.showHidden();
      CPU3.showHidden();
      break;
    case TURN:
      table.turn(a.passCard());
      currentState = GameStates.OPTIONS;
      table.currentBet = 0;
      table.currentBet += 10 * floor(random(0,11));
      table.currentBet += 10 * floor(random(0,11));
      table.currentBet += 10 * floor(random(0,11));
      CPU1.showHidden();
      CPU2.showHidden();
      CPU3.showHidden();
      break;
    case RIVER:
      table.river(a.passCard());
      table.currentBet = 0;
      currentState = GameStates.OPTIONS;
      table.currentBet += 10 * floor(random(0,11));
      table.currentBet += 10 * floor(random(0,11));
      table.currentBet += 10 * floor(random(0,11));
      CPU1.showHidden();
      CPU2.showHidden();
      CPU3.showHidden();
      break; 
    case RESULTS:
      table.currentBet = 0;
      //for (int k = 0; k < 7; k++){
      //  player1.mergedCards[k].goTo(k*70,600);
      //  player1.mergedCards[k].show();
      //}
      //text(player1.value, 200, 200);
      //text(CPU1.value, 200, 210);
      //text(CPU2.value, 200, 220);
      //text(CPU3.value, 200, 230);
      replay.show();
      if (replay.clicked()){
        currentState = GameStates.PASSCARDS;
      }
      textSize(32);
      if(player1.value > CPU1.value && player1.value > CPU2.value && player1.value > CPU3.value){
        text("You Won!", 400, 220);
      } else if(player1.value < CPU1.value || player1.value <  CPU2.value || player1.value < CPU3.value){
        text("You Lost!", 400, 220);
      } else if (player1.value == CPU1.value || player1.value == CPU2.value || player1.value == CPU3.value){
        text("Tie!", 400, 220);
      }
      CPU1.show();
      CPU2.show();
      CPU3.show();
      if(player1.money <= 0){
        text("No more money!", 400, 500);
        noLoop();
      }
      break;
    case OPTIONS:
      add10.show();
      add100.show();
      addMoney.show();
      fold.show();
      text("Pot: $" + table.pot, 400, 500);
      text("Current Bet: $" + table.currentBet, 400, 510);
      text("Money: $" + player1.money, 750, 780);
      if (addMoney.clicked()){
        player1.money -= table.currentBet;
        CPU1.money -= table.currentBet;
        CPU2.money -= table.currentBet;
        CPU3.money -= table.currentBet;
        table.pot += table.currentBet * 4;
        if (stateNum == 0){
          currentState = GameStates.FLOP;
        }
        if (stateNum == 1){
          currentState = GameStates.TURN;
        }
        if (stateNum == 2){
          currentState = GameStates.RIVER;
        }
        if (stateNum == 3){
          player1.mergeCards(table.cardArray);
          player1.sortCards();
          CPU1.mergeCards(table.cardArray);
          CPU1.sortCards();
          CPU2.mergeCards(table.cardArray);
          CPU2.sortCards();
          CPU3.mergeCards(table.cardArray);
          CPU3.sortCards();
          player1.determineValue();
          CPU1.determineValue();
          CPU2.determineValue();
          CPU3.determineValue();
          if(player1.value > CPU1.value && player1.value > CPU2.value && player1.value > CPU3.value){
            player1.money += table.pot;
          } else if (player1.value == CPU1.value || player1.value == CPU2.value || player1.value == CPU3.value){
            player1.money += table.pot/4;
          }
          currentState = GameStates.RESULTS;
        }
        stateNum++;
      }
      if (fold.clicked()){
        currentState = GameStates.PASSCARDS;
      }
      if(add10.clicked()){
        table.currentBet += 10;
      }
      if(add100.clicked()){
        table.currentBet += 100;
      }
      CPU1.showHidden();
      CPU2.showHidden();
      CPU3.showHidden();
      break;
  }
  table.displayAll();
  player1.show();
}
