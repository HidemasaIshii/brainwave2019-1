public class RecommendState extends State{
  String[] song_info = new String[5];
  String[] song_text = new String[5];
  
  RecommendState(Music music, BrainWave brainwave){
    this.music = music;
    this.brainwave = brainwave;
  }
  
  void drawState() {
    background(bgCol);
    fill(textCol);
    textSize(64);
    text("あなたへのオススメ", width * 0.5, height * 0.3);
    textSize(32);
    
    // Topidxを取得する
    top_idx = brainwave.getTopidx();

    song_info = music.getInfo(top_idx);

    for(int i=0; i<5; i++){
      song_text[i] = song_info[i];
      text(song_text[i], width * 0.5, height * (0.4 + 0.08 * i));
    }
    text("sキーを押してスタートに戻る", width * 0.5, height * 0.8);  
  }
  
  State decideState() {
    if (keyPressed && key == 's'){  // もしスペースキーが押されたら
      background(bgCol);
      return new StartState(music, brainwave);
    }
    return this;
    
  } 
}
