class Deck {
  Card[] cards = new Card[52];
  int b = 0;
  public Deck(){
    int index = 0;
    //for (int j = 0; j < 13; j++){
    //  for (int i = 0; i < 4; i ++){
    //    cards[index] = new Card(pics[index], j + 2, i, index);
    //    index++;
    //  }
    //}
    int value = 0;
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum] = new Card(pics[cardNum], cardNum + 1, 0, value);
      value+=4;
    }
    value = 1;
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum + 13] = new Card(pics[cardNum + 13], cardNum + 1, 1, value);
      value+=4;
    }
    value = 2;
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum + 26] = new Card(pics[cardNum + 26], cardNum + 1, 2, value);
      value+=4;
    }
    value = 3;
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum + 39] = new Card(pics[cardNum + 39], cardNum + 1, 3, value);
      value+=4;
    }
  }
  public void revealDeck(){
    for (int j = 0; j < 52; j++) {
      cards[j].goTo(0 + j%11 * 73, j/11 * 96);
      cards[j].show();
    }
  }
  public void shuffle(){
   for (int i = 0; i < cards.length; i++){ 
     int randint = floor(random(0,52));
     Card a = cards[i];
     cards[i] = cards[randint];
     cards[randint] = a;
    }
    b = 0;
  }
  public Card passCard(){
    b++;
    return cards[b-1];
  }
  public void reset(){
    b = 0;
    shuffle();
  }
}
