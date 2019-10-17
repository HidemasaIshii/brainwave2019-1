public class StartState extends State{
  boolean start = false;
  float b_width = 200;
  float b_height = 100;
  float b_x = width * 0.5;
  float b_y = height * 0.8;
  
  Button button = new Button(b_x, b_y, b_width, b_height);
  
  void drawState(){
    background(100);
    textSize(64);
    text("脳が喜ぶ音楽を探そう", width * 0.5, height * 0.3);
    textSize(32);
    text("～あなたが落ち着くのにぴったりの音楽～", width * 0.5, height * 0.5);
    // スタートボタン
    button.run();
  }
  
  State decideState(){
    if (button.isPush()){  // もしスタートボタンが押されたら
      background(basic);
      return new SampleState();
    }
    return this;
  }
  
  void mousePressed(){
   if(mouseX >= b_x - b_width/2 && mouseX <= b_x + b_width/2
     && mouseY >= b_y - b_height/2 && mouseY <= b_y + b_height/2){
     start = true;
    // スタートボタンが押される
    fill(50, 200, 50);
    rectMode(CENTER);
    rect(b_x, b_y, b_width, b_height);
    fill(255);  
    } 
  }
}
