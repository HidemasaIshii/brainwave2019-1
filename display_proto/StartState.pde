public class StartState extends State{
  void drawState(){
    textSize(64);
    text("脳が喜ぶ音楽を探そう", width * 0.5, height * 0.3);
    textSize(32);
    text("～あなたが落ち着くのにぴったりの音楽～", width * 0.5, height * 0.5);
    text("スペースキーを押してスタート！", width * 0.5, height * 0.8);
  }
  
  State decideState(){
    if (keyPressed && key == ' '){  // もしスペースキーが押されたら
      background(0);
      return new SampleState();
    }
    return this;
  }
}
