public class SampleState extends State{
  boolean playing = false;
  int wait_time = 5;  // サンプル再生までの時間[s]
  int duration = 20;  // 1サンプル当たりの再生時間[s]
  
  float tileCount = 20;
  color circleColor = color(0);
  int circleAlpha = 180;
  int actRandomSeed = 0;
  
  // arrays for color components values
  int[] hueValues = new int[int(tileCount*tileCount)];
  int[] saturationValues = new int[int(tileCount*tileCount)];
  int[] brightnessValues = new int[int(tileCount*tileCount)];
  
  SampleState(Music music, BrainWave brainwave){
    this.music = music;
    this.brainwave = brainwave;
    // init with random values
    for (int i=0; i<tileCount*tileCount; i++) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = (int) random(0,70);
      brightnessValues[i] = (int) random(0,70);
    }
  }
  
  void drawState() {
    // 背景を描画する
    background(bgCol);
    noFill();
    strokeWeight(5);
    colorMode(HSB,360,100,100,100);
    int tile = 0;
    for (int gridY=0; gridY<tileCount; gridY++) {
      for (int gridX=0; gridX<tileCount; gridX++) {
        float posX = width/tileCount * gridX + width/tileCount/2;
        float posY = height/tileCount * gridY + height/tileCount/2;
  
//        float shiftX = random(-sin(t/10)*sin(t/10)*50, sin(t/10)*sin(t/10)*50);
//        float shiftY = random(-sin(t/10)*sin(t/10)*50, sin(t/10)*sin(t/10)*50);
        float shiftX = 0;
        float shiftY = 0;
        // 少し色を変える
        hueValues[tile] += 3 + random(-1,2);
        if(hueValues[tile]>180) hueValues[tile] += 5;
        if(hueValues[tile]>360) hueValues[tile] -= 360;
        saturationValues[tile] += 0.5 + random(-1,1);
        if(saturationValues[tile]>70) saturationValues[tile] -= 20;
        if(saturationValues[tile]<0) saturationValues[tile] = 10;
        brightnessValues[tile] += 0.5 + random(-1,1);
        if(brightnessValues[tile]>70) brightnessValues[tile] -= 20;
        if(brightnessValues[tile]<0) brightnessValues[tile] = 10;
        
        stroke(hueValues[tile],saturationValues[tile], brightnessValues[tile], circleAlpha);
  
        ellipse(posX+shiftX, posY+shiftY, width/tileCount/2-5, width/tileCount/2-5);
        
        tile++;
      }
    }
    colorMode(RGB,255,255,255,100);
    fill(textCol);
    // 再生を始める前
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
    }
    // サンプル再生中
    else {
      // background(bgCol);
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
        fill(250,90);
        text("No.5", width * 0.5, height * 0.4);
      }
    }
    
    // 経過時間の表示
    textSize(64);
    fill(textCol);
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
