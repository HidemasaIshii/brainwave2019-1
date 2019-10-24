public class SampleState extends State{
  boolean playing = false;
  int sampleNum = 3;  // サンプル数
  int wait_time = 5;  // サンプル再生までの時間[s]
  int duration = 5;  // 1サンプル当たりの経過時間[s]
  
  void drawState() {
    if (!playing) {
      int bgcolor = int(255/t);
      if (bgcolor > 200) bgcolor = 200;
      if (bgcolor < 0) bgcolor = 0;
      background(bgcolor);
      textSize(64);
      text("目を閉じてください", width * 0.5, height * 0.3);
    
      // 1回だけ音楽を再生し始める＋脳波の計測をスタートする
      if (t > wait_time) {
        
        // 音楽を再生する
        // 脳波の計測を始める
        playing = true;
      }
    } else {
      background(bgCol);
    }
    text(nf(t, 1, 3)  + "sec.", width * 0.5, height * 0.7);
  }
  
  State decideState() {
    if (t > wait_time + sampleNum * duration) {  // サンプルが再生し終わったら
      background(bgCol);
      return new recommendState();  // おすすめを表示する
    }
    return this;
  }
}
