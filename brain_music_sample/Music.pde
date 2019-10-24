public class Music {
  long t_start;
  String[] info;
  
  void setStart(time) {
    t_start = time; 
  }
  
  String[] getInfo(idx) {
    // 指定された曲に関連する情報を返す
    return info;
  }
  
}
