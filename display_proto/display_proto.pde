State state;

void setup() {
  // 日本語フォントを作成し指定する呪文
  PFont font = createFont("メイリオ",64,true);//文字の作成
  textFont (font); // 選択したフォントを指定する
//  printArray(PFont.list());
  size(1000, 800);
  textSize(64);
  textAlign(CENTER);
  fill(255);
  state = new StartState();
}

void draw() {
  state = state.doState();
}
