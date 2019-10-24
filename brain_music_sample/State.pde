abstract public class State {
  // 各画面ごとの処理を記述するクラスの親クラス
  long t_start;
  float t;
  int top_idx;
  Music music;
  BrainWave brainwave;
  
  State doState() {
    // 経過時間tを更新する
    t = (millis() - t_start) / 1000.0 ;
    // 実際の処理
    drawState();
    // 次のフレームの状態を選ぶ
    return decideState();
  }
  
  abstract void drawState();  // 状態に応じた描画をする
  abstract State decideState();  // 次の状態を返す
}
