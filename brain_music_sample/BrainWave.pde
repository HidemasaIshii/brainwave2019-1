public class BrainWave {
  long t_start;
  int top_idx;
  float[] average;
  
  void setStart(long time) {
    t_start = time;
  }
  
  int getTopidx() {
    // 何かしら計算する
    return top_idx;    
  }
  
  void calc() {
    // 経過時間に応じて平均を計算したり
    
  }
  
  void oscEvent(OscMessage msg){
    // sumにデータを加算していく 
  }
}
