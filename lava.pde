class lava extends FGameObject {
  PImage[]Frames;
  int currentFrame, numFrame, i;
  int p;
  lava(int x, int y, int frames, String start, String end) {
    super();
    numFrame=frames;
    setHeight(15);
    Frames=new PImage[frames];
    setName("lava");
    setPosition(x, y);
    for (int i=0; i<Frames.length; i++) {
      Frames[i]=loadImage(start+i+end);
      Frames[i].resize(gridsize, gridsize);
    }
    setStatic(true);
    setSensor(true);
  }
  void act() {
    attachImage(Frames[currentFrame]);
    if (currentFrame==0) p=1;
    else if (currentFrame==19)p=-1;
    if (frameCount%10==0)currentFrame+=p;
  }
  void show() {
  }
  boolean Loop() {
    if (i==19) return true;
    return false;
  }
}
