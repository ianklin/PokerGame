class Card {
  PImage sprite;
  int number;
  String suit;
  float x = 0;
  float y = 0;
  public Card(){
  }
  public Card(PImage sprite, int number, String suit) {
    this.sprite = sprite;
    this.number = number;
    this.suit = suit;
  }
  public void show(){
    image(sprite, x, y);
  }
  public void goTo(float x, float y){
    this.x = x;
    this.y = y;
  }  
}
