import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

public class PlayMusic{
  Minim minim = new Minim(this);
  AudioPlayer player;
  int s = second()%5;
  
  void setup(){
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
    player.close();
    minim.stop();
  }
  super.stop();
}

/*
void setup(){ 
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

void draw()
{
  background(0);
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}
*/
