import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

State state;
Minim minim;

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
  println(sketchPath());
  println(dataPath(""));
  minim = new Minim(this);
}

void draw() {
  state = state.doState();
}

public class PlayMusic{
//  Minim minim = new Minim(this);
  AudioPlayer player;
  int s = second()%5;
  
  void playMusic(){
    int i = s;
    for(int count = 0;count < 5;count++){
      if(i == 0){
        player = minim.loadFile("1.mp3");
        println(player.length());
        player.play();
        int temp = millis();
        while(millis()-temp != player.length()){
          
        }
        i++;
      }
      else if(i == 1){
        player = minim.loadFile("2.mp3");
        println(player.length());
        player.play();
        int temp = millis();
        while(millis()-temp != player.length()){
          
        }
        i++;
      }
      else if(i == 2){
        player = minim.loadFile("3.mp3");
        println(player.length());
        player.play();
        int temp = millis();
        while(millis()-temp != player.length()){
          
        }
        i++;
      }
      else if(i == 3){
        player = minim.loadFile("4.mp3");
        println(player.length());
        player.play();
        int temp = millis();
        while(millis()-temp != player.length()){
          
        }
        i++;
      }
      else if(i == 4){
        player = minim.loadFile("5.mp3");
        println(player.length());
        player.play();
        int temp = millis();
        while(millis()-temp != player.length()){
          
        }
        i = 1;
      }
    }
  }
  
  void stop(){
    player.close();
    minim.stop();
//    super.stop();
  }
}
