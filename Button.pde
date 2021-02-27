class Button{
  String text;
  float x;
  float y;
  float l = 100;
  float w = 25;
  public Button(){
    text = " ";
    x = 0;
    y = 0;
  }
  public Button(String text, float x, float y){
    this.text = text;
    this.x = x;
    this.y = y;
  }
  public void show(){
    fill(255);
    rect(x, y, l, w);
    fill(0);
    text(text, x, y);
  }
}
