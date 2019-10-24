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
<<<<<<< HEAD
=======
  // 画面の設定
  // 日本語フォントを作成し指定する
  PFont font = createFont("メイリオ",64,true);//文字の作成
  textFont (font); // 選択したフォントを指定する
  size(1000, 800);
  textSize(64);
  textAlign(CENTER);
  fill(255);
>>>>>>> ishii_branch
}

void draw() {
  state = state.doState();
}
