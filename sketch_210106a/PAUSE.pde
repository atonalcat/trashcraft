void pause(){
  pTimer++;
  background(255);
  text("PAUSED, press P to go back.", width/2,height/2);
  if(pkey && pTimer>30){
   mode=GAME; 
   pTimer=0;
  }
    
}
