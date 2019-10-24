public class Music {
  AudioPlayer player;
  long t_start;
  String[] info;
  Minim minim;
  int index = (int)t_start%5;
  int[] SampleList = new int[5];
  for(int i = 0; i < 5; i++) {
    SampleList[i] = index;
    if(index == 4) index = 0;
    else index++;
  }
  
  Music(Minim minim) {
    this.minim = minim;
  }
  
  void setStart(long time) {
    t_start = time; 
  }
  
  void playSample() {
    // サンプルを再生する
    int count = 0;
    float t = (millis() - t_start) / 1000.0;
    if(t <= 90 && count == 0){
      count++;
      player = minim.loadFile("1.mp3");
      player.play();
    }
    else if(t > 90 && t <= 180 && count == 1){
      count++;
      player = minim.loadFile("2.mp3");
      player.play();
    }
    else if(t > 180 && t <= 270 && count == 2){
      count++;
      player = minim.loadFile("3.mp3");
      player.play();
    }
    else if(t > 270 && t <= 360 && count == 3){
      count++;
      player = minim.loadFile("4.mp3");
      player.play();
    }
    else if(t > 360 && t <= 450 && count == 4){
      count++;
      player = minim.loadFile("5.mp3");
      player.play();
    }
    
  }
  
  String[] getInfo(int idx) {
    // 指定された曲に関連する情報を返す
    return info;
  }
  
}
