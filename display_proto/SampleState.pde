public class SampleState extends State{
  int sampleNum = 3;  // サンプル数
  int wait_time = 5;  // サンプル再生までの時間[s]
  int duration = 5;  // 1サンプル当たりの経過時間[s]
  boolean playing = false;
  void drawState(){
    int i = int((t-float(wait_time))/duration);
    if (i < 0) i = 0;

    if (!playing) {
      int bgcolor = int(255/t);
      if (bgcolor > 150) bgcolor = 150;
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
    }
    
    if (wait_time + i * duration < t && t < (i + 1) * duration + wait_time){
      // iサンプル目
      background(int(255/sampleNum) * i, int(200/sampleNum) * i, int(150/sampleNum) * i);  // 背景色を変えてみる
      text(i, width * 0.2, height * 0.3);
    }
    
//    fill(100,100,255);
    text(nf(t, 1, 3)  + "sec.", width * 0.5, height * 0.7);

  }
  
  State decideState(){
    if (t > wait_time + sampleNum * duration) {  // サンプルが再生し終わったら
      background(0);
      return new recommendState();  // おすすめを表示する
    }
    return this;
  }
}
