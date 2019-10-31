public class RecommendState extends State{
  String[][] song_info = new String[3][3];
  float b_width = 150;  // ボタンの幅
  float b_height = 60;  // ボタンの高さ
  float[] b_yloc = new float[3];  // ボタンを表示するy座標
  
  boolean pressed = false;  // ボタンが押されているか
  
  RecommendState(Music music, BrainWave brainwave){
    this.music = music;
    this.brainwave = brainwave;
    // Topidxを取得する
    top_idx = brainwave.getTopidx();
    song_info = music.getInfo(top_idx);
  }
  
  void drawState() {
    background(bgCol);
    fill(textCol);
    textSize(64);
    text("あなたへのオススメ", width * 0.5, height * 0.15);
    textSize(32);
    
    // 曲名を表示する
    for(int i=0; i<3; i++){
      text(song_info[i][0], width * 0.4, height * (0.25 + 0.2 * i));
    }
    textSize(24);
    // アーティスト名を表示する
    for(int i=0; i<3; i++){
      text(song_info[i][1], width * 0.4, height * (0.35 + 0.2 * i));
    }
    // リンクを表示する
    for(int i=0; i<3; i++){
          noStroke();
          fill(50,100,50);
          rectMode(CENTER);
          b_yloc[i] = height * (0.35 + 0.2 * i) - 9;
          rect(width * 0.8, b_yloc[i], b_width, b_height);
          
          fill(255);
          textSize(24);
          text("聴いてみる", width * 0.8, height * (0.35 + 0.2 * i));
    }
    if(!pressed){  // ボタンが押されていないとき
      if(mousePressed == true) pressed = true;
    } else {  // ボタンがすでに押されているとき
      if(mousePressed != true){
        openLink(e.getX(), e.getY());  // カーソルが適切な位置にあればリンクを開いて
        pressed = false;  // 状態を元に戻す
      }
    }
    
    textSize(32);
    text("sキーを押して閉じる", width * 0.5, height * 0.9);
  }
  
  // ボタンが押されたらリンクに飛ぶ
  void openLink(float x, float y) {
//    println("pushed");
    println(song_info[0][2], song_info[1][2], song_info[2][2]);
    println(x,y);
    if(width * 0.8 - b_width/2 <= x && x <= width*0.8 + b_width/2){ //<>//
      if(b_yloc[0] - b_height/2 <= y && y <= b_yloc[0] + b_height/2){
        print("button0 pushed!");
        link(song_info[0][2]);
      }
      else if(b_yloc[1] - b_height/2 <= y && y <= b_yloc[1] + b_height/2){
        print("button1 pushed!");
        link(song_info[1][2]);
      }
      else if(b_yloc[2] - b_height/2 <= y && y <= b_yloc[2] + b_height/2){
        print("button2 pushed!");
        link(song_info[2][2]);
      }
    }
  }
  
  State decideState() {
    if (keyPressed && key == 's'){  // もしsキーが押されたら
      background(bgCol);
      //return new StartState(music, brainwave);
      exit();
    }
    return this;
    
  } 
}
