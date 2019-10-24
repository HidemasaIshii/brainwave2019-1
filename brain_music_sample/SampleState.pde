public class SampleState extends State{
  boolean playing = false;
  
  void drawState() {
<<<<<<< HEAD
=======
    if (!playing) {
      int bgcolor = int(255/t);
      if (bgcolor > 200) bgcolor = 200;
      if (bgcolor < 0) bgcolor = 0;
      background(bgcolor);
      textSize(64);
      text("目を閉じてください", width * 0.5, height * 0.3);
>>>>>>> ishii_branch
    
    
    
    
    
  }
  
  State decideState() {
    
    
  }
}
