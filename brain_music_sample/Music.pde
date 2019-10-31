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
    
    // 曲情報の設定
    // ジャンル0: シャンソン
    info[0][0][0] = "ラ・ヴィ・アン・ローズ La Vie En Rose"; info[0][0][1] = "Edith Piaf"; info[0][0][2] = "https://www.youtube.com/watch?v=kFzViYkZAz4";
    info[0][1][0] = "聞かせてよ愛の言葉をParlez-moi d’amour"; info[0][1][1] = "Lucienne Boyer"; info[0][1][2] = "https://www.youtube.com/watch?v=rIAQWr34De0";
    info[0][2][0] = "オー・シャンゼリゼ Les Champs-Elysées"; info[0][2][1] = "Danièle Vidal"; info[0][2][2] = "https://www.youtube.com/watch?time_continue=128&v=oamRCeLNAWA ";
    
    // ジャンル1: シャンソン
    info[1][0][0] = "ラ・ヴィ・アン・ローズ La Vie En Rose"; info[1][0][1] = "Edith Piaf"; info[0][0][2] = "https://www.youtube.com/watch?v=kFzViYkZAz4";
    info[1][1][0] = "聞かせてよ愛の言葉をParlez-moi d’amour"; info[1][1][1] = "Lucienne Boyer"; info[0][1][2] = "https://www.youtube.com/watch?v=rIAQWr34De0";
    info[1][2][0] = "オー・シャンゼリゼ Les Champs-Elysées"; info[1][2][1] = "Danièle Vidal"; info[0][2][2] = "https://www.youtube.com/watch?time_continue=128&v=oamRCeLNAWA ";
    
    // ジャンル2: シャンソン
    info[2][0][0] = "ラ・ヴィ・アン・ローズ La Vie En Rose"; info[2][0][1] = "Edith Piaf"; info[0][0][2] = "https://www.youtube.com/watch?v=kFzViYkZAz4";
    info[2][1][0] = "聞かせてよ愛の言葉をParlez-moi d’amour"; info[2][1][1] = "Lucienne Boyer"; info[0][1][2] = "https://www.youtube.com/watch?v=rIAQWr34De0";
    info[2][2][0] = "オー・シャンゼリゼ Les Champs-Elysées"; info[2][2][1] = "Danièle Vidal"; info[0][2][2] = "https://www.youtube.com/watch?time_continue=128&v=oamRCeLNAWA ";
    
    // ジャンル3: シャンソン
    info[3][0][0] = "ラ・ヴィ・アン・ローズ La Vie En Rose"; info[3][0][1] = "Edith Piaf"; info[0][0][2] = "https://www.youtube.com/watch?v=kFzViYkZAz4";
    info[3][1][0] = "聞かせてよ愛の言葉をParlez-moi d’amour"; info[3][1][1] = "Lucienne Boyer"; info[0][1][2] = "https://www.youtube.com/watch?v=rIAQWr34De0";
    info[3][2][0] = "オー・シャンゼリゼ Les Champs-Elysées"; info[3][2][1] = "Danièle Vidal"; info[0][2][2] = "https://www.youtube.com/watch?time_continue=128&v=oamRCeLNAWA ";
    
    // ジャンル4: シャンソン
    info[4][0][0] = "ラ・ヴィ・アン・ローズ La Vie En Rose"; info[4][0][1] = "Edith Piaf"; info[0][0][2] = "https://www.youtube.com/watch?v=kFzViYkZAz4";
    info[4][1][0] = "聞かせてよ愛の言葉をParlez-moi d’amour"; info[4][1][1] = "Lucienne Boyer"; info[0][1][2] = "https://www.youtube.com/watch?v=rIAQWr34De0";
    info[4][2][0] = "オー・シャンゼリゼ Les Champs-Elysées"; info[4][2][1] = "Danièle Vidal"; info[0][2][2] = "https://www.youtube.com/watch?time_continue=128&v=oamRCeLNAWA ";    
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
