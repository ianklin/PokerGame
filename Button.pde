class Button{
  String text;
  float x;
  float y;
  float l;
  float h;
  public Button(){
    text = " ";
    x = 0;
    y = 0;
    l = 0;
    h = 0;
  }
  public Button(String text, float x, float y, float l, float h){
    this.text = text;
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
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
  public boolean clicked(){
    if(mouseOver() && MouseInput.mouseClicked){
      return true;
    } else {
      return false;
    }
  }
}

//class CallButton extends Button{
//  public CallButton(){
//    super();
//  }
//  public CallButton(float x, float y){
//    super("Call", x, y);
//  }
//}
