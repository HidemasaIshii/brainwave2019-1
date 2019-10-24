State state;
Minim minim;

void setup() {
  // 画面の設定とか
  state = new StartState();
  minim = new Minim(this);
}

void draw() {
  state = state.doState();
}
