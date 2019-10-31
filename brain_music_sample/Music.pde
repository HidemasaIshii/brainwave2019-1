import java.util.*;

public class Music {
  AudioPlayer player;
  long t_start;
  Minim minim;
  int duration = 90;  // 1サンプル当たりの再生時間[s]，初期設定90秒
  int count = 0;
  
  //サンプル曲の配列
  //String[] SampleList = {"1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3"};
  ArrayList<String> SampleList = new ArrayList<String>();
  
  //おすすめ曲の配列
  //TODO:曲目とそれに関連する情報
  String[][][] info = new String[5][3][3];
  
  Music(Minim minim) {
    this.minim = minim;
    SampleList.add("1.mp3");
    SampleList.add("2.mp3");
    SampleList.add("3.mp3");
    SampleList.add("4.mp3");
    SampleList.add("5.mp3");
    Collections.shuffle(SampleList); //サンプルの並び替え
    
    // テスト用に曲情報をいれる
    for(int i=0; i<5; i++){
      for(int j=0; j<3; j++){
        for(int k=0; k<3; k++){
          if(k < 2){
            info[i][j][k] = "("+i +", "+ j +", "+ k+")";
          } else {
            info[i][j][k] = "https://www.youtube.com/watch?v=kFzViYkZAz4";
          }
        }
      }
    }
  }
  
  void setStart(long time) {
    t_start = time; 
  }
  
  void playSample(int duration) {
    // サンプルを再生する
    
    float t = (millis() - t_start) / 1000.0;
    if(t <= duration && count == 0){
      count++;
      player = minim.loadFile(SampleList.get(0));
      player.play(0); //再生開始時間の指定
    }
    else if(t > duration && t <= 2*duration && count == 1){
      count++;
      player.close(); //前の音楽ファイルの再生を止める
      player = minim.loadFile(SampleList.get(1));
      player.play(0);
    }
    else if(t > 2*duration && t <= 3*duration && count == 2){
      count++;
      player.close();
      player = minim.loadFile(SampleList.get(2));
      player.play(0);
    }
    else if(t > 3*duration && t <= 4*duration && count == 3){
      count++;
      player.close();
      player = minim.loadFile(SampleList.get(3));
      player.play(0);
    }
    else if(t > 4*duration && t <= 5*duration && count == 4){
      count++;
      player.close();
      player = minim.loadFile(SampleList.get(4));
      player.play(0);
    }
    else if(t > 5*duration && count == 5){
      count++;
      player.close();
    }
    
  }
  
  String[][] getInfo(int idx) {
    // 指定された曲に関連する情報を返す
    if(SampleList.get(idx) == "1.mp3") return info[0];
    else if(SampleList.get(idx) == "2.mp3") return info[1];
    else if(SampleList.get(idx) == "3.mp3") return info[2];
    else if(SampleList.get(idx) == "4.mp3") return info[3];
    else return info[4];
  }
  
}
