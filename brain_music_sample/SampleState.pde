public class SampleState extends State{
  boolean playing = false;
  int wait_time = 5;  // サンプル再生までの時間[s]
  int duration = 10;  // 1サンプル当たりの再生時間[s]
  
  SampleState(Music music, BrainWave brainwave){
    this.music = music;
    this.brainwave = brainwave;
  }
  
  void drawState() {
    if (!playing) {
      int bgcolor = int(255/t);
      if (bgcolor > 150) bgcolor = 150;
      if (bgcolor < 0) bgcolor = 0;
      background(bgcolor);
      textSize(64);
      text("目を閉じてください", width * 0.5, height * 0.3);
    
      // 1回だけ音楽を再生し始める＋脳波の計測をスタートする
      if (t > wait_time) {
        t_start = millis();
        long start = millis();
        // 音楽を再生する
        music.setStart(start);
        // 脳波の計測を始める
        brainwave.setStart(start);
        playing = true;
      }
    } else {
      background(bgCol);
      music.playSample(duration);
      brainwave.calc(duration);
      // 何曲目か表示する
      if(0*duration < t && t < 1*duration){
        textSize(256);
        fill(250,170);
        text("No.1", width * 0.5, height * 0.4);
      } else if(1*duration < t && t < 2*duration){
        textSize(256);
        fill(250,170);
        text("No.2", width * 0.5, height * 0.4);
      } else if(2*duration < t && t < 3*duration){
        textSize(256);
        fill(250,170);
        text("No.3", width * 0.5, height * 0.4);
      } else if(3*duration < t && t < 4*duration){
        textSize(256);
        fill(250,170);
        text("No.4", width * 0.5, height * 0.4);
      } else if(4*duration < t && t < 5*duration){
        textSize(256);
        fill(250,170);
        text("No.5", width * 0.5, height * 0.4);
      }
    }
    textSize(64);
    fill(230);
    text(int(t)  + "sec.", width * 0.8, height * 0.85);  // nf(t,1,3)
  }
  
  State decideState() {
    if (t > wait_time + sampleNum * duration) {  // サンプルが再生し終わったら
      background(bgCol);
      return new RecommendState(music,brainwave);  // おすすめを表示する
    }
    return this;
  }
}
