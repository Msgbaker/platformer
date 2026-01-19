class FPlayer extends FGameObject {
  FBody feet= new FBox(7, 2);
  FBody Larm= new FBox(2, 8);
  FBody Rarm= new FBox(2, 8);
  FBody head= new FBox(8, 2);
  boolean Lcling, Rcling;
  FPlayer() {
    super(1);
    playerSetup();
    partSetup();
  }
  void act() {
    playerLogic();
    partLogic();
    wakeUp();
    pvx=abs(getVelocityX());
    pvy=abs(getVelocityY());
    //println(pvy);
  }
  void show() {
  }
  void playerLogic() {
    px=getX();
    py=getY();
    movement();
    wallClingJump();
  }
  void movement(){
    if (a) {
      vx=-70;
      setVelocity(vx, getVelocityY());
    } else vx=0;
    if (d) {
      vx=70;
      setVelocity(vx, getVelocityY());
    } else vx=0;
    if (w && feetTouch()) {
      vy=-120;
      setVelocity(getVelocityX(), vy);
    } else vy=10;
    if (isTouching("tip")||isTouching("base")||isTouching("lava")) setPosition(300, 200);
  }
  void wallClingJump() {
    if (RarmTouch() && pvx>0 && pvy>0) Rcling=true;
    else if (!RarmTouch())Rcling=false;
    if (Rcling) {
      setVelocity(0, 0);
    }
    if (w && Rcling && !doubleInput(w, d)) {
      setVelocity(-50, -100);
      Rcling=false;
    }
    if (Rcling && feetTouch())Rcling=false;
    ///
    if (LarmTouch() && pvx>0 && pvy>0) Lcling=true;
    else if (!LarmTouch())Lcling=false;
    if (Lcling) {
      setVelocity(0, 0);
    }
    if (w && Lcling && !doubleInput(w, a)) {
      setVelocity(50, -100);
      Lcling=false;
    }
    if (Lcling && feetTouch())Lcling=false;    
  }
  boolean doubleInput(boolean input1, boolean input2) {
    if (input1 && input2) return true;
    return false;
  }
  boolean touching() {
    if (isTouching("ground")||isTouching("drip")) return true;
    return false;
  }
  boolean feetTouch() {
    if (partTouching("ground", feet)||partTouching("drip", feet)) return true;
    return false;
  }
  boolean LarmTouch() {
    if (partTouching("ground", Larm)) return true;
    return false;
  }
  boolean RarmTouch() {
    if (partTouching("ground", Rarm)) return true;
    return false;
  }
  boolean partTouching(String name, FBody part) {
    ArrayList<FContact> contact=part.getContacts();
    for (int i=0; i<contact.size(); i++) {
      FContact c=contact.get(i);
      if (c.contains(name)) return true;
    }
    return false;
  }
  void partLogic() {
    feet.setPosition(px, py+4);
    Larm.setPosition(px-4, py);
    Rarm.setPosition(px+4, py);
    head.setPosition(px, py-4);
    feet.setVelocity(getVelocityX(), getVelocityY());
    Larm.setVelocity(getVelocityX(), getVelocityY());
    Rarm.setVelocity(getVelocityX(), getVelocityY());
    head.setVelocity(getVelocityX(), getVelocityY());
  }
  void playerSetup() {
    setHeight(10);
    setWidth(10);
    setFillColor(red);
    setNoFill();
    setPosition(300, 200);
    setName("player");
    setFriction(2);
    setRotatable(false);
  }
  void partSetup() {
    //feet
    feet.setNoStroke();
    feet.setParent(player);
    feet.setFillColor(red);
    feet.setSensor(true);
    feet.setName("feet");
    feet.setFriction(2);
    feet.setRotatable(false);
    world.add(feet);
    //Larm
    Larm.setNoStroke();
    Larm.setParent(player);
    Larm.setFillColor(red);
    Larm.setSensor(true);
    Larm.setName("Larm");
    Larm.setFriction(2);
    Larm.setRotatable(false);
    world.add(Larm);
    //Rarm
    Rarm.setNoStroke();
    Rarm.setParent(player);
    Rarm.setFillColor(red);
    Rarm.setSensor(true);
    Rarm.setName("Larm");
    Rarm.setFriction(2);
    Rarm.setRotatable(false);
    world.add(Rarm);
    //head
    head.setNoStroke();
    head.setParent(player);
    head.setFillColor(red);
    head.setSensor(true);
    head.setName("Larm");
    head.setFriction(2);
    head.setRotatable(false);
    world.add(head);
  }
}
