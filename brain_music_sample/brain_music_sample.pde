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
BrainWave brainwave;
Music music;
Minim minim;

void setup() {
  // 画面の設定とか
  minim = new Minim(this);
  brainwave = new BrainWave();
  music = new Music(minim);
  state = new StartState(music, brainwave);
}

void draw() {
  state = state.doState();
}
