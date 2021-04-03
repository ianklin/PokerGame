class Card {
  PImage sprite;
  int number;
  int suit;
  int value;
  float x = 0;
  float y = 0;
  public Card(){
    number = 0;
    suit = -1;
    value = 0;
  }
  public Card(PImage sprite, int number, int suit, int value) {
    this.sprite = sprite;
    this.number = number;
    this.suit = suit;
    this.value = value;
    if (number == 1){
      this.number = 14;
      this.value += 52;
    }
  }
  public void show(){
    image(sprite, x, y);
  }
  public void goTo(float x, float y){
    this.x = x;
    this.y = y;
  }  
}
