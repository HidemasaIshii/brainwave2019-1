public class StartState extends State{
  StartState(Music music, BrainWave brainwave) {
    this.music = music;
    this.brainwave = brainwave;
  }
  
 void drawState() {
   
 }
 
<<<<<<< HEAD
 State decideState() {
   
 }
=======
  State decideState() {
    if (keyPressed && key == ' '){  // もしもスペースキーが押されたら
      return new SampleState();
    }
    return this;
  }
>>>>>>> ishii_branch
}
