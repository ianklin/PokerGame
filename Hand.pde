class Hand {
  Card[] cards = new Card[2];
  float x = 0;
  float y = 0;
  public Hand(){
  }
  public void getCards(Card c, Card d){
    cards[0] = c;
    cards[1] = d;
  }
  public void goTo(float x, float y){
    this.x = x;
    this.y = y;
  }
  public void show(){
    cards[0].goTo(x, y);
    cards[0].show();
    cards[1].goTo(x+73, y);
    cards[1].show();
  }
}
