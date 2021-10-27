import processing.video.*;
Movie[] myMovie = new Movie[9];
int s = 36;
int nVid = int(random(0, myMovie.length));
int PreviousNVid;
int posX = width/2;
int posY = height/2;
boolean text = false;

void setup(){
  print(nVid);
  //size(800, 800, P3D);
  fullScreen(P3D);
  //subGreen = loadShader("blur.glsl"); 
  myMovie[0] = new Movie(this, "Video3.mp4");
  myMovie[1] = new Movie(this, "Video4.mp4");
  myMovie[2] = new Movie(this, "Video5.mp4");
  myMovie[3] = new Movie(this, "Video6.mp4");
  myMovie[4] = new Movie(this, "Video7.mp4");
  myMovie[5] = new Movie(this, "Video8.mp4");
  //myMovie[6] = new Movie(this, "Video9.mp4");
  myMovie[6] = new Movie(this, "Video10.mp4");
  myMovie[7] = new Movie(this, "Video11.mp4");
  myMovie[8] = new Movie(this, "Video12.mp4");
  
  /*for(int i = 0; i < myMovie.length; i++){
    myMovie[i].loop();
  }*/
  myMovie[nVid].play();
  
}

void draw(){
 
  /*subGreen.set("u_resolution", float(width), float(height));
  subGreen.set("u_mouse", float(mouseX), float(mouseY));
  subGreen.set("u_time", millis() / 1000.0);*/
  
  
  
  background(0);
  translate(width/2, height/2);
  //rotateY(float(mouseX - width/2) / 800);
  //rotateX(-float(mouseY - height/2) / 1000);
  //rotateZ(PI/(180/1));
  imageMode(CENTER); 
  switch (nVid){
    case 0:
      image(myMovie[nVid], posX + 20/* - 400*/, posY, 9 * s, 16 * s);
      break;
      
    case 1:
      image(myMovie[nVid], posX + 20/* - 400*/, posY, 9 * s, 16 * s);
      break;
      
    case 3:
      image(myMovie[nVid], posX + 3/* - 400*/, posY, 9 * s, 16 * s);
      break;
      
    default:
      image(myMovie[nVid], posX/* - 400*/, posY, 9 * s, 16 * s);
      break; 
  }
  //image(myMovie[nVid], posX/* - 400*/, posY, 9 * s, 16 * s);
  if(text == true) text("Actual: " + nVid + "\nPrevious: " + PreviousNVid, posX, posY + 200);
  //myMovie.blend(myMovie, 0, 0, 132, 400, 268, 0, 132, 400, SUBTRACT); 
  //image(myMovie, 0, 0, 16 * s, 9 * s);
  
  /*for(int i = 0; i < myMovie.length; i++){
    myMovie[i].play();
  }*/
}

void movieEvent(Movie m) {
  m.read();
}


void keyPressed() {
  if (keyCode == LEFT && myMovie[nVid].time() > 5) {
    //myMovie.jump(0);
    myMovie[nVid].stop();
    PreviousNVid = nVid;
    while(PreviousNVid == nVid) nVid = int(random(0, myMovie.length));
    if(PreviousNVid != nVid){
      myMovie[nVid].jump(0);
      myMovie[nVid].play();
    }

  }
  
  //Zoom
  if (key == 'a') s += 0.5;
    
    
  switch (key){
    //Zoom
    case 'x':
      s += 1;
      break;
      
    case 'X':
      s += -0.5;
      break;
    
    //Move
    case 'z':
      posY += -5;
      break;
      
    case 'q':
      posX += -5;
      break;
      
    case 's':
      posY += 5;
      break;
      
    case 'd':
      posX += 5;
      break;
      
    //Precise Move 
    case 'Z':
      posY += -1;
      break;
      
    case 'Q':
      posX += -1;
      break;
      
    case 'S':
      posY += 1;
      break;
      
    case 'D':
      posX += 1;
      break;
      
    case 'o':
      posY += -10;
      break;
      
    case 'k':
      posX += -10;
      break;
      
    case 'l':
      posY += 10;
      break;
      
    case 'm':
      posX += 10;
      break;
      
    //Debug: Vitesse
    case 'P':
        myMovie[nVid].speed(5.0);
      break;
      
    case 'p':
      /*for(int i = 0; i < myMovie.length; i++){
        myMovie[i].speed(1.0);
      }*/
      myMovie[nVid].speed(1.0);
      break;
      
    //Debug: Piste
    case '0':
      playMediaNumPad(0);
      break;
      
    case '1':
      playMediaNumPad(1);
      break;
      
    case '2':
      playMediaNumPad(2);
      break;
      
    case '3':
      playMediaNumPad(3);
      break;
       
    case '4':
      playMediaNumPad(4);
      break;
      
    case '5':
      playMediaNumPad(5);
      break;
      
    case '6':
      playMediaNumPad(6);
      break;
      
    case '7':
      playMediaNumPad(7);
      break; 
         
    case '8':
      playMediaNumPad(8);
      break; 
      
    //Debuig: Text  
    case '.':
      text = !text;
      break;
      
  }

}

void playMediaNumPad(int nVideo) {
      myMovie[nVid].stop();
      nVid = nVideo;
      myMovie[nVid].jump(0);
      myMovie[nVid].play();
}
