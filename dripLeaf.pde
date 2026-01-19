class dripLeaf extends FGameObject {
  PImage state=drip;
  int dripCooldown=0;
  int dripDelay=0;
  float x, y;
  FBody box;
  dripLeaf(int x, int y) {
    super();
    this.x=x;
    this.y=y;
    setName("drip");
    setPosition(x, y-7.8);
    setStatic(true);
    setNoFill();
    setNoStroke();
    setHeight(2);
    //image
    box= new FBox(10, 10);
    box.setStatic(true);
    box.setSensor(true);
    world.add(box);
  }
  void act() {
    box.attachImage(state);
    box.setPosition(x, y);
    if (isTouching("player") && dripCooldown<=0) {
      dripCooldown=300;
      dripDelay=100;
      setSensor(false);
      setPosition(x, y-7.8);
    }
    if(dripDelay>0) dripDelay--;
    if (dripDelay==0 && dripCooldown>0) {
      setSensor(true);
      dripCooldown--;
    }
    if (dripCooldown<300 && dripCooldown!=0) {
      setSensor(true);
      state=dripDrop;
      setName("drop");
      setPosition(x, y-7);
    }
    if (!isTouching("player") && dripCooldown<=0) {
      state=drip;
      setSensor(false);
      setName("drip");
    }
  }
  void show() {
  }
}
