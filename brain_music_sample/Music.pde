public class Music {
  long t_start;
  String[] info;
  Minim minim;
  
  Music(Minim minim) {
    this.minim = minim;
  }
  
  void setStart(time) {
    t_start = time; 
  }
  
  void playSample() {
    // サンプルを再生する
    
  }
  
  String[] getInfo(idx) {
    // 指定された曲に関連する情報を返す
    return info;
  }
  
}
