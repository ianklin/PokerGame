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
  public boolean determinePair(){
    for (int i = 0; i < 6; i++){
      if(mergedCards[i].number == mergedCards[i + 1].number){
        value = 100 + mergedCards[i].value + mergedCards[i + 1].value;
        return true;
      } 
    }
    return false;
  }
  public boolean determineDoublePair(){
    int pairCount = 0;
    int highest = 0;
    for (int a = 0; a < 6; a++){
      if (mergedCards[a].number == mergedCards[a + 1].number){
        pairCount++;
        if (mergedCards[a+1].value > highest){
          highest = mergedCards[a+1].value;
        }
      }
    } 
    if (pairCount >= 2){
      value = 1000 + highest;
      return true;
    } else {
      return false;
    }
  }
  public boolean determineThreeOfKind(){
    for (int b = 0; b < 5; b++){
      if (mergedCards[b].number == mergedCards[b + 1].number && mergedCards[b].number == mergedCards[b + 2].number){
        if (b <= 4){
          for (int c = b + 3; c < 5; c++){
            if (mergedCards[c].number == mergedCards[c + 1].number && mergedCards[c].number == mergedCards[c + 2].number){
              value = 10000 + mergedCards[c + 2].value;
              return true;
            } 
          }
          value = 10000 + mergedCards[b + 2].value;
          return true;
        } else {
          value = 10000 + mergedCards[b + 2].value;
          return true;
        }
      }
    }
    return false;
  }
  public int determineValue(){
    if (determineThreeOfKind()){
      return value;
    } else if (determineDoublePair()){
      return value;
    } else if (determinePair()){
      return value;
    } else {
      determineHighest();
      return value;
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
