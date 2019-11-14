import netP5.*;
import oscP5.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

State state;
BrainWave brainwave;
Music music;
Minim minim;
MouseEvent e;

void setup() {
  // 各インスタンスの生成
  minim = new Minim(this);
  brainwave = new BrainWave();
  music = new Music(minim);
  state = new StartState(music, brainwave);
  // 画面の設定
  // 日本語フォントを作成し指定する呪文
  PFont font = createFont("Osaka",64,true); //文字の作成
  // PFont font = createFont("メイリオ",64,true); //文字の作成
  textFont (font); // 選択したフォントを指定する
  // size(1000, 800);
  fullScreen();
  textSize(64);
  textAlign(CENTER);
  fill(255);
}

void draw() {
  state = state.doState(e);
}

void mousePressed(MouseEvent e_draw){
  e = e_draw;
}
