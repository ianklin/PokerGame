class Button{
  String text;
  float x;
  float y;
  float l = 100;
  float h = 25;
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
    rect(x, y, l, h);
    textAlign(CENTER, CENTER);
    fill(0);
    text(text, x + l/2, y + h/2);
  }
  public boolean mouseOver(){
    if(mouseX > x && mouseX < x + l && mouseY > y && mouseY < y + h){
      return true;
    } else {
      return false;
    }
  }
}
