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
  public boolean pair(){
    for (int i = 0; i < 6; i++){
      if(mergedCards[i].number == mergedCards[i + 1].number){
        value = 100 + mergedCards[i].value + mergedCards[i + 1].value;
        return true;
      } 
    }
    return false;
  }
  public boolean doublePair(){
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
  public boolean threeOfKind(){
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
  
  //Don't forget to check three of a kind ties.
  
  public boolean straight(){
    Card[] modifiedCardList = new Card[11];
    int f = 0;
    for(int j = 0; j < 11; j++){
      modifiedCardList[j] = new Card();
    }
    for(int ace = 0; ace < 7; ace++){
      if(mergedCards[ace].number == 14){
        modifiedCardList[f] = new Card(pics[0], 1, mergedCards[ace].suit, 0);
        f++;
      }
    }
    for(int e = 0; e < 5; e++){
      if (mergedCards[e].number == mergedCards[e + 1].number){
        if (mergedCards[e].number == mergedCards[e + 2].number){
          modifiedCardList[f] = mergedCards[e + 2];
          e += 2;
        } else {
          modifiedCardList[f] = mergedCards[e + 1];
          e++;
        }
      } else {
        modifiedCardList[f] = mergedCards[e];
      }
      f++;
    }
    modifiedCardList[f] = mergedCards[6];
    //for(int print = 0; print < 11; print++){
    //  println(modifiedCardList[print].number);
    //}
    for(int d = 0; d < 2; d++){
      if (modifiedCardList[d].number + 1 == modifiedCardList[d+1].number && modifiedCardList[d+1].number + 1 == modifiedCardList[d+2].number && modifiedCardList[d+2].number + 1 == modifiedCardList[d+3].number && modifiedCardList[d+3].number + 1 == modifiedCardList[d+4].number){
        if (d <= 2) {
          for(int g = 0; g < 2; g++){
            if (modifiedCardList[g].number + 1 == modifiedCardList[g+1].number && modifiedCardList[g+1].number + 1 == modifiedCardList[g+2].number && modifiedCardList[g+2].number + 1 == modifiedCardList[g+3].number && modifiedCardList[g+3].number + 1 == modifiedCardList[g+4].number){ 
              value = 100000 + modifiedCardList[g+4].value;
              return true;
            }
          }
          value = 100000 + modifiedCardList[d+4].value;
          return true;
        } else {
          value = 100000 + modifiedCardList[d+4].value;
          return true;
        }
      }
    }
    return false;
  }
  public boolean findFlush(){
    int diaCount = 0;
    int clubCount = 0;
    int heartCount = 0;
    int spadeCount = 0;
    int diaHighest = 0;
    int clubHighest = 0;
    int heartHighest = 0;
    int spadeHighest = 0;
    for(int z = 0; z < 7; z++){
      if(mergedCards[z].suit == 0){
        diaCount++;
        if (mergedCards[z].value > diaHighest){
          diaHighest = mergedCards[z].value;
        }
      } else if (mergedCards[z].suit == 1){
        clubCount++;
        if (mergedCards[z].value > clubHighest){
          clubHighest = mergedCards[z].value;
        }
      } else if (mergedCards[z].suit == 2){
        heartCount++;
        if (mergedCards[z].value > heartHighest){
          heartHighest = mergedCards[z].value;
        }
      } else {
        spadeCount++;
        if (mergedCards[z].value > spadeHighest){
          spadeHighest = mergedCards[z].value;
        }
      }
    }
    if (spadeCount >= 5){
      value = 1000000 + spadeHighest;
      return true;
    } else if (heartCount >= 5){
      value = 1000000 + heartHighest;
      return true;
    } else if (clubCount >= 5){
      value = 1000000 + clubHighest;
      return true;
    } else if (diaCount >= 5){
      value = 1000000 + diaHighest;
      return true;
    } else {
      return false;
    }
  }
  public boolean fullHouse(){
    int tripleValue = 0;
    Card[] fullHouseList = mergedCards.clone();
    //for(int print = 0; print < 7; print++){
    //  println(fullHouseList[print].number);
    //}
    if (threeOfKind()){
      println("threeOfKind");
      for (int b = 0; b < 5; b++){
        println(b);
        if (fullHouseList[b].number == fullHouseList[b + 1].number && fullHouseList[b].number == fullHouseList[b + 2].number){
          if (b <= 4){
            for (int c = b + 3; c < 5; c++){
              println(c);
              if (fullHouseList[c].number == fullHouseList[c + 1].number && fullHouseList[c].number == fullHouseList[c + 2].number){
                tripleValue += fullHouseList[c].value;
                tripleValue += fullHouseList[c + 1].value;
                tripleValue += fullHouseList[c + 2].value;
                println("triple");
                println(tripleValue);
                fullHouseList[c] = new Card();
                fullHouseList[c + 1] = new Card();
                fullHouseList[c + 2] = new Card();
                for(int pair = 0; pair < fullHouseList.length - 1; pair++){
                  if(fullHouseList[pair].number == fullHouseList[pair + 1].number) {
                    value = 10000000 + tripleValue + fullHouseList[pair].value + fullHouseList[pair + 1].value;
                    return true;
                  }
                }
              } 
            }
            tripleValue += fullHouseList[b].value;            
            tripleValue += fullHouseList[b + 1].value;
            tripleValue += fullHouseList[b + 2].value;
            println("triple");
            println(tripleValue);
            fullHouseList[b] = new Card();
            fullHouseList[b + 1] = new Card();
            fullHouseList[b + 2] = new Card();
            break;
          } else {
            tripleValue += fullHouseList[b].value;            
            tripleValue += fullHouseList[b + 1].value;
            tripleValue += fullHouseList[b + 2].value;
            println("triple");
            println(tripleValue);
            fullHouseList[b] = new Card();
            fullHouseList[b + 1] = new Card();
            fullHouseList[b + 2] = new Card();
            break;
          }
        }
      }
      for(int pair = 0; pair < fullHouseList.length - 1; pair++){
        if(fullHouseList[pair].number == fullHouseList[pair + 1].number) {
          value = 10000000 + tripleValue + fullHouseList[pair].value + fullHouseList[pair + 1].value;
          return true;
        }
      }
    }
    return false;
  }
  public int determineValue(){
    if (fullHouse()){
      return value;
    } else if (findFlush()){
      return value;
    } else if (straight()){
      return value;
    } else if (threeOfKind()){
      return value;
    } else if (doublePair()){
      return value;
    } else if (pair()){
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
