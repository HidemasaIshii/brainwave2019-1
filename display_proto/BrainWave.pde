import oscP5.*;
import netP5.*;

final int N_CHANNELS = 4;
final int BUFFER_SIZE = 220;
final float MAX_MICROVOLTS = 1682.815;
final float DISPLAY_SCALE = 200.0;
final String[] LABELS = new String[] {
  "TP9", "FP1", "FP2", "TP10"
};

final color BG_COLOR = color(0, 0, 0);
final color AXIS_COLOR = color(255, 0, 0);
final color GRAPH_COLOR = color(0, 0, 255);
final color LABEL_COLOR = color(255, 255, 0);
final int LABEL_SIZE = 21;

final int PORT = 5000;
OscP5 oscP5 = new OscP5(this, PORT);

float[][] buffer = new float[N_CHANNELS][BUFFER_SIZE];
int pointer = 0;
float[] offsetX = new float[N_CHANNELS];
float[] offsetY = new float[N_CHANNELS];


final int N_MUSIC = 5;
final int TIME_SPAN = 90;
float[] sum = new float[N_MUSIC];
int count = 0;
float[] avg = new avg[N_MUSIC];
float[] avg_tmp = new avg_tmp[N_MUSIC];
float[] avg_of_Nch = new avg_of_Nch[N_CHANNELS];
int mu_idx=0;

void setup(){
  size(1000, 600);
  frameRate(30);
  smooth();
  
  for(int ch = 0; ch < N_CHANNELS; ch++){
    avg = pow(10,10);
  }

}


void draw(){
/*
  float x1, y1, x2, y2;
  background(BG_COLOR);
  for(int ch = 0; ch < N_CHANNELS; ch++){
    for(int t = 0; t < BUFFER_SIZE; t++){
      stroke(GRAPH_COLOR);
      x1 = offsetX[ch] + t;
      y1 = offsetY[ch] + buffer[ch][(t + pointer) % BUFFER_SIZE] * DISPLAY_SCALE;
      x2 = offsetX[ch] + t + 1;
      y2 = offsetY[ch] + buffer[ch][(t + 1 + pointer) % BUFFER_SIZE] * DISPLAY_SCALE;
      line(x1, y1, x2, y2);
    }
    stroke(AXIS_COLOR);
    x1 = offsetX[ch];
    y1 = offsetY[ch];
    x2 = offsetX[ch] + BUFFER_SIZE;
    y2 = offsetY[ch];
    line(x1, y1, x2, y2);
  }
  fill(LABEL_COLOR);
  textSize(LABEL_SIZE);
  for(int ch = 0; ch < N_CHANNELS; ch++){
    text(LABELS[ch], offsetX[ch], offsetY[ch]);
  }
*/
}


void oscEvent(OscMessage msg){
  float data;
  if(msg.checkAddrPattern("/muse/eeg")){
    
    count += 1;
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      sum[ch] += data;
      
      //data = (data - (MAX_MICROVOLTS / 2)) / (MAX_MICROVOLTS / 2); // -1.0 1.0
      //buffer[ch][pointer] = data;
    }
    
    if(){   //every 90s
      for(int ch = 0; ch < N_CHANNELS; ch++){
        avg_tmp[ch] = sum[ch] / count; 
      }
      
      for(int ch = 0; ch < N_CHANNELS; ch++){
        avg_of_Nch[mu_idx] += avg_tmp[ch];
      }
      avg_of_Nch[mu_idx] = avg_of_Nch[mu_idx] / N_CHANNELS;
      
      mu_idx += 1
    
  }
}
