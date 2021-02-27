class GameTable{
  Card[] cardArray = new Card[5];
  public GameTable(){
  }
   public void flop(Card c, Card d, Card e){
    cardArray[0] = c;
    cardArray[1] = d;
    cardArray[2] = e;
  }
  public void turn(Card f){
    cardArray[3] = f;
  }
  public void river(Card g){
    cardArray[4] = g;
  }
  public void displayAll(){
    for(int i = 0; i < cardArray.length;i++){
      if (cardArray[i] != null){
        cardArray[i].goTo(225 + i*70,350);
        cardArray[i].show();
      }
    }
  }
}
