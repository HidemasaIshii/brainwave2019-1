import netP5.*;
import oscP5.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// 

State state;
Minim minim;

void setup() {
  // 画面の設定とか
  minim = new Minim(this);
  state = new StartState(minim);
}

void draw() {
  state = state.doState();
}
