import java.util.Objects;

public class Button {

  float b_width, b_height;    // ボタンの大きさ
  float b_x, b_y;  // ボタンの位置
  float nb, sb, pb;  // 各状態での明るさ
  color b_col;  // ボタンの色
  color str_col;  // ラベルのテキスト色
  String b_str;  // ボタンのラベル
  int b_state;

  Button(float x, float y, float sizeX, float sizeY) {
    this.b_x = x;
    this.b_y = y;
    this.b_width = sizeX;
    this.b_height = sizeY;
    this.b_col = color(150);
    this.str_col = color(255);
    this.b_str = "Button";
    
    this.nb = 1;
    this.sb = 0.8;
    this.pb = 0.6;
  }
  
  void designButton(String b_str, color str_col, color b_col){
    this.b_str = b_str;
    this.str_col = str_col;
    this.b_col = b_col;
  }
  
  void run() {
   rogic();
   display();
  }
  
  void display() {
    noStroke();
    fill(b_col);
    rectMode(CENTER);
    rect(b_x, b_y, b_width, b_height);
    
    fill(str_col);
    textSize(32);
    text(b_str, b_x, b_y + 5);
  }
  
  void rogic() {
    b_state = checkState();
  }
  
  boolean isPush() {
    if (checkState()==2) return true;
    return false;
  }
  
  int checkState() {
    if (!checkInMouse()) return 0;  // 重なっていない
    if (!mousePressed) return 1;  // 押されていない
    return 2;  // 押されている
  }
  
  boolean checkInMouse() {
    if (mouseX > b_x - b_width/2 && mouseX < b_x + b_width/2){
      if (mouseY > b_y - b_height/2 && mouseY < b_y + b_height/2) {
        return true;
      }
    }
    return false;
  }
    
  void changeColor() {
    switch(b_state) {
    case 0:
      fill(hue(b_col), saturation(b_col), brightness(b_col)*nb);
      break;
    case 1:
      fill(hue(b_col), saturation(b_col), brightness(b_col)*sb);
      break;
    case 2:
      fill(hue(b_col), saturation(b_col), brightness(b_col)*pb);
      break;

    default:
      fill(0, 0, 0);
      break;
    }
  }
}
