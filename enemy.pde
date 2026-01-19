class enemy extends FGameObject{
  float x,y,vx,vy;
  float strafeY,strafeX;
  boolean aggro,strafed,dive;
  int dir,dirX,strafeCooldown,yReset,diveTimer;
  enemy(float x,float y){
    super(1);
    this.x=x;
    this.y=y;
    dir=(int)random(0,2);
    dirX=(int)random(0,2);
    aggro=false;
    setFillColor(red);
    setPosition(x,y);
    setRotatable(false);
    strafeCooldown=0;
    setHeight(8);
    setWidth(12);
    fish=Rfish;
    diveTimer=500;
  }
  void act(){
    attachImage(fish);
    if(diveTimer!=0)strafe();

    if(dist(px,py,getX(),getY())<40 && !strafed){
      aggro=true; 
    }else aggro=false;
    if(diveTimer==0) dive=true;else dive=true;
    if(dive){
      vx=px-getX();
      vy=py-getY();
      setVelocity(vx,vy);
    }
    if(aggro){
      if(diveTimer>0)diveTimer--;
    }else diveTimer=100;
  }
  void show(){
  }
  void strafe(){
    if(getX()<px) fish=Lfish;
    if(getX()>px) fish=Rfish;
    if(frameCount%80==0){
      dir=(int)random(0,2);
      dirX=(int)random(0,2);
    }
    if(strafeCooldown>0) strafeCooldown--;
    if(strafeCooldown==0){
      strafed=false;
      strafeCooldown=80;
    }
    if(yReset>0 && !aggro) yReset--;
    if(yReset==0){
      yReset=80;
      strafeY=0;
    }
    if(aggro && !strafed){
      if(dir==0)strafeY-=20;
      if(dir==1 && dirX==0)strafeX+=20;
      if(dir==1 && dirX==1)strafeX-=20;
      strafed=true;
    }
    if(getY()>y+strafeY){
      vy=-50;
      setVelocity(getVelocityX(),vy);
    }
    if(dirX==0 && getX()<x+strafeX){
      vx=50;
      setVelocity(vx,getVelocityY());
    }
    if(dirX==1 && getX()>x+strafeX){
      vx=-50;
      setVelocity(vx,getVelocityY());
    }    
  }
}
