public class RecommendState extends State{ //<>//
  PImage[] img = new PImage[5];
  String[][] song_info = new String[4][3];
  
  // 聴くボタン
  float b_width = 220;  // ボタンの幅
  float b_height = 80;  // ボタンの高さ
  float[] b_yloc = new float[3];  // ボタンを表示するy座標
  
  // 閉じるボタン
  float close_width = 320;  // ボタンの幅
  float close_height = 70;  // ボタンの高さ
  float close_yloc;  // ボタンを表示するy座標  
  
  boolean pressed = false;  // ボタンが押されているか
  
  String recommendText = "あなたへのおススメは…";
  String genre;
  
  RecommendState(Music music, BrainWave brainwave){
    this.music = music;
    this.brainwave = brainwave;
    // Topidxを取得する
    top_idx = brainwave.getTopidx();
    song_info = music.getInfo(top_idx);
    genre = music.getGenre(top_idx);
    recommendText += genre;
    for(int i=0; i<5; i++){
      String fileName = i+1 + ".jpg";      
      img[i] = loadImage(fileName);
    }
  }
  
  void drawState() {
    // 背景を表示する
//    background(bgCol);
    tint(100);
    if(genre =="シャンソン"){
      image(img[0],0,0,width,height);
    } else if(genre=="カンツォーネ"){
      image(img[1],0,0,width,height);
    } else if(genre=="アラブ音楽"){
      image(img[2],0,0,width,height);
    } else if(genre=="ケルト音楽"){
      image(img[3],0,0,width,height);
    } else if(genre=="中国伝統音楽"){
      image(img[4],0,0,width,height);
    }
    // 曲情報の枠を表示する
    noStroke();
    fill(15,50);
    rectMode(CENTER);
    rect(width*0.5, height*0.5, width*0.9, height*0.65);
    
    fill(textCol);
    textSize(80);
    text(recommendText, width * 0.5, height * 0.12);
    textSize(48);
    
    // 曲名を表示する
    for(int i=0; i<3; i++){
      text(song_info[i+1][0], width * 0.4, height * (0.25 + 0.2 * i));
    }
    textSize(48);
    // アーティスト名を表示する
    for(int i=0; i<3; i++){
      text(song_info[i+1][1], width * 0.4, height * (0.35 + 0.2 * i));
    }
    // リンクを表示する
    for(int i=0; i<3; i++){
          noStroke();
          fill(30,75,30);
          rectMode(CENTER);
          b_yloc[i] = height * (0.35 + 0.2 * i) - 9;
          rect(width * 0.8, b_yloc[i], b_width, b_height);
          
          fill(250);
          textSize(36);
          text("聴いてみる", width * 0.8, height * (0.35 + 0.2 * i));
    }
    if(!pressed){  // ボタンが押されていないとき
      if(mousePressed == true) pressed = true;
    } else {  // ボタンがすでに押されているとき
      if(mousePressed != true){
        buttonAction(e.getX(), e.getY());  // カーソルが適切な位置にあればリンクを開いて
        pressed = false;  // 状態を元に戻す
      }
    }
    
    noStroke();
    fill(50,50,50);
    rectMode(CENTER);
    close_yloc = height * 0.9 - 9;
    rect(width * 0.5, close_yloc, close_width, close_height);
    
    fill(255);
    textSize(28);
    text("ウィンドウを閉じる", width * 0.5, height * 0.9);
  }
  
  // ボタンが押されたら下の処理を実行する
  void buttonAction(float x, float y) {
    // 聴くボタン
    if(width * 0.8 - b_width/2 <= x && x <= width*0.8 + b_width/2){
      if(b_yloc[0] - b_height/2 <= y && y <= b_yloc[0] + b_height/2){
        print("button0 pushed!");
        link(song_info[1][2]);
      }
      else if(b_yloc[1] - b_height/2 <= y && y <= b_yloc[1] + b_height/2){
        print("button1 pushed!");
        link(song_info[2][2]);
      }
      else if(b_yloc[2] - b_height/2 <= y && y <= b_yloc[2] + b_height/2){
        print("button2 pushed!");
        link(song_info[3][2]);
      }
    }
    // 閉じるボタン
    if(width * 0.5 - close_width/2 <= x && x <= width*0.5 + close_width/2){
      if(close_yloc - close_height/2 <= y && y <= close_yloc + close_height/2){
        print("close pushed!");
        exit();
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
