class Hand {
  Card[] cards = new Card[2];
  float x = 0;
  float y = 0;
  int value = 0;
  Card[] mergedCards = new Card[7];
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
  public void mergeCards(Card[] a){
    for (int i = 0; i < 5; i++){
      mergedCards[i] = a[i];
    }
    mergedCards[5] = cards[0];
    mergedCards[6] = cards[1];
  }
  public void sortCards(){
    for (int i = 0; i < 7 - 1; i++){
      for (int j = 0; j < 7 - i - 1; j++){
        if (mergedCards[j].value > mergedCards[j + 1].value){
          Card a = mergedCards[j];
          mergedCards[j] = mergedCards[j + 1];
          mergedCards[j + 1] = a;
        }
      }
    }
  }
  public void determineHighest(){
    value = mergedCards[6].value;
  }
  public void determineHandValue(){
    for (int i = 0; i < 7; i++){
      for (int j = i + 1; j < 7; j++){
        if(mergedCards[i].number == mergedCards[j].number){
          //for (int a = 0; a < 7; a++){
          //  for (int b = a + 1; b < 7; b++) {
          //    if (mergedCards[a].number == mergedCards[b].number && mergedCards[a].number != mergedCards[i].number){
          //      value = 1000 + mergedCards[a].value;
          //    } else {
                value = 100 + mergedCards[i].value + mergedCards[j].value;
          //    }
          //  }
          //}
        }
      }
    }
  }
//Determining the Value of your hand
//RoyalFlush         1000000000 + value of all cards + the suit
//StraightFlush      1000000000 + value of all cards + the suit
//Four of a kind     100000000 + value of the fours and the high card
//FullHouse          10000000 + value of the triple and the pair
//Flush              1000000 + value highest card in the combo
//Straight           100000 + value of the high card
//Three of a Kind    10000 + value of the triple and the high card
//Two Pair           1000 + value of the higher pair
//Pair               100 + value of each card
//High Card          4-56
}
