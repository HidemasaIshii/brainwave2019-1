abstract public class State {
  // 経過時間を記録するための変数
  long t_start;
  float t;
  color basic = color(100);
  State() {
    t_start = millis(); 
  }
  
  State doState() {
    // 経過時間t
    t = (millis() - t_start) / 1000.0;
    // 画面を表示する
    drawState();
    // 状態遷移のコード
    return decideState();
  }
  
  abstract void drawState();  // 状態に応じた描画をする
  abstract State decideState();  // 次の状態を返す
}
