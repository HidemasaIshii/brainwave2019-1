import java.util.*;

public class Music {
  AudioPlayer player;
  long t_start;
  Minim minim;
  //サンプル曲の配列
  String[] SampleList = {"1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3"};
  //TODO:サンプルの並べ替え
  
  
  //おすすめ曲の配列
  //TODO:曲目とそれに関連する情報
  String[][] info = {};
  
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
      player = minim.loadFile(SampleList[0]);
      player.play(0); //再生開始時間の指定
    }
    else if(t > 90 && t <= 180 && count == 1){
      count++;
      player.close(); //前の音楽ファイルの再生を止める
      player = minim.loadFile(SampleList[1]);
      player.play(0);
    }
    else if(t > 180 && t <= 270 && count == 2){
      count++;
      player.close();
      player = minim.loadFile(SampleList[2]);
      player.play(0);
    }
    else if(t > 270 && t <= 360 && count == 3){
      count++;
      player.close();
      player = minim.loadFile(SampleList[3]);
      player.play(0);
    }
    else if(t > 360 && t <= 450 && count == 4){
      count++;
      player.close();
      player = minim.loadFile(SampleList[4]);
      player.play(0);
    }
    else if(t > 450 && count == 5){
      count++;
      player.close();
    }
    
  }
  
  String[] getInfo(int idx) {
    // 指定された曲に関連する情報を返す
    if(SampleList[idx] == "1.mp3") return info[0];
    else if(SampleList[idx] == "2.mp3") return info[1];
    else if(SampleList[idx] == "3.mp3") return info[2];
    else if(SampleList[idx] == "4.mp3") return info[3];
    else return info[4];
  }
  
}
