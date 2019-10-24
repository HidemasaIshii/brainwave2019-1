public class recommendState extends State{
  void drawState() {
    background(bgCol);
    fill(textCol);
    textSize(64);
    text("あなたへのオススメ", width * 0.5, height * 0.3);
    textSize(32);
    text("sキーを押してスタートに戻る", width * 0.5, height * 0.8);  
  }
  
  State decideState() {
    if (keyPressed && key == 's'){  // もしスペースキーが押されたら
      background(bgCol);
      return new StartState(music, brainwave);
    }
    return this;
    
  } 
}
