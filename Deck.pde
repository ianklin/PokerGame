class Deck {
  Card[] cards = new Card[52];
  int b = 0;
  public Deck(){
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum] = new Card(pics[cardNum], cardNum + 1, "diamonds");
    }
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum + 13] = new Card(pics[cardNum + 13], cardNum + 1, "clubs");
    }
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum + 26] = new Card(pics[cardNum + 26], cardNum + 1, "hearts");
    }
    for (int cardNum = 0; cardNum < 13; cardNum++){
      cards[cardNum + 39] = new Card(pics[cardNum + 39], cardNum + 1, "spades");
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
}
